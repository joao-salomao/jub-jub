import '../annotation_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:think_and_write_new/entities/think.dart';
import 'package:think_and_write_new/utils/navigation.dart';
import 'package:think_and_write_new/entities/annotation.dart';
import 'package:think_and_write_new/views/widgets/app_text.dart';
import 'package:think_and_write_new/views/widgets/app_alert.dart';
import 'package:think_and_write_new/services/database_service.dart';
import 'package:think_and_write_new/views/controllers/annotation_list_controller.dart';
import 'package:think_and_write_new/views/think/children/annotation/children/file/annotation_file_list.dart';

class AnnotationListPage extends StatefulWidget {
  final Think think;
  AnnotationListPage(this.think);

  @override
  _AnnotationListPageState createState() => _AnnotationListPageState();
}

class _AnnotationListPageState extends State<AnnotationListPage> {
  Think get think => widget.think;

  AnnotationListController controller;
  final DatabaseService databaseService = DatabaseService();

  @override
  void initState() {
    super.initState();
    controller = AnnotationListController(think.id);
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

          if (controller.stream.value.documents.length == 0) {
            return _empty();
          }

          return _list();
        },
      ),
    );
  }

  _list() {
    final list = _getAnnotationsList();
    return ListView(
      children: List.generate(
        list.length,
        (i) {
          final annotation = list[i];
          return Container(
            padding: EdgeInsets.all(16),
            child: Card(
              elevation: 30,
              color: annotation.color,
              child: InkWell(
                splashColor: Colors.white,
                onTap: () => push(
                  context,
                  AnnotationForm(
                    think,
                    annotation: annotation,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        annotation.title,
                        fontSize: 18,
                        bold: true,
                      ),
                      Container(
                        child: AnnotationFileList(
                          think,
                          annotation,
                        ),
                      ),
                      AppText(
                        annotation.text,
                        textAlign: TextAlign.justify,
                      ),
                      Container(
                        width: double.infinity,
                        child: AppText(
                          "~ ${annotation.createdAt}",
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            onPressed: () =>
                                _onClickDeleteAnnotation(annotation),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
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
      child: Text(
        "Algo deu errado",
        style: TextStyle(
          decorationColor: Colors.red,
        ),
      ),
    );
  }

  _empty() {
    return Center(
      child: Text(
        "Você não possui nenhuma anotação nesse think",
        style: TextStyle(
          decorationColor: Colors.black,
        ),
      ),
    );
  }

  List<Annotation> _getAnnotationsList() {
    return controller.stream.value.documents
        .map((document) => Annotation.fromDocumentSnapshot(document))
        .toList();
  }

  _onClickDeleteAnnotation(Annotation annotation) {
    alert(context, "Você tem certeza ?",
        "Esse pensamento será deletado permanentemente.", callback: () {
      databaseService.deleteAnnotation(
        think.id,
        annotation.id,
        annotation.getAnnotationFilePaths(),
      );
    });
  }
}
