import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:think_and_write_new/entities/think.dart';
import 'package:think_and_write_new/utils/navigation.dart';
import 'package:think_and_write_new/entities/annotation.dart';
import 'package:think_and_write_new/views/widgets/app_text.dart';
import 'package:think_and_write_new/entities/annotation_file.dart';
import 'package:think_and_write_new/services/database_service.dart';
import 'package:think_and_write_new/views/widgets/app_image_viewer.dart';
import 'package:think_and_write_new/views/controllers/annotation_file_list_controller.dart';

class AnnotationFileList extends StatefulWidget {
  final Think think;
  final Annotation annotation;
  final DatabaseService databaseService = DatabaseService();
  AnnotationFileList(this.think, this.annotation);

  @override
  _AnnotationFileListState createState() => _AnnotationFileListState();
}

class _AnnotationFileListState extends State<AnnotationFileList> {
  AnnotationFileListController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnnotationFileListController(widget.think.id, widget.annotation.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (_) {
          if (controller.stream.hasError) {
            return _error();
          }

          if (controller.stream.data == null) {
            return _loading();
          }

          return _list();
        },
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.black,
      ),
    );
  }

  _error() {
    return Center(
      child: AppText("Algo deu errado, não foi possível carregar os arquivos"),
    );
  }

  _list() {
    final list = _getAnnotationFiles();
    return Container(
      child: Column(
        children: List.generate(
          list.length,
          (i) {
            AnnotationFile file = list[i];
            return Container(
              margin: EdgeInsets.only(
                top: 16,
              ),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: AppText(
                      file.title,
                      fontSize: 16,
                      bold: true,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  GestureDetector(
                    child: Image.network(
                      file.url,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                    onTap: () {
                      push(
                        context,
                        AppImageViewer(file.url),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List _getAnnotationFiles() {
    final list = controller.stream.value.documents
        .map((document) => AnnotationFile.fromDocumentSnapshot(document))
        .toList();
    widget.annotation.files = list;
    return list;
  }
}
