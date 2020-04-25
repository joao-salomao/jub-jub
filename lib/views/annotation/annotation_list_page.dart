import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:potato_notes/entities/annotation.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/views/state/app_state.dart';
import 'package:potato_notes/views/widgets/app_alert.dart';
import 'package:potato_notes/views/widgets/app_text.dart';
import 'annotation_form.dart';

class AnnotationListPage extends StatefulWidget {
  final Think think;
  AnnotationListPage(this.think);

  @override
  _AnnotationListPageState createState() => _AnnotationListPageState();
}

class _AnnotationListPageState extends State<AnnotationListPage> {
  final state = GetIt.I<AppState>();
  Think get think => widget.think;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: List.generate(
          think.annotations.length,
          (i) {
            final annotation = think.annotations[i];
            return Container(
              padding: EdgeInsets.all(5),
              child: Card(
                elevation: 10,
                color: annotation.color,
                child: InkWell(
                  splashColor: Colors.white,
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
                        // Container(
                        //   child: AnnotationFileList(
                        //     think,
                        //     annotation,
                        //   ),
                        // ),
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
                              onPressed: () => _onClickDeleteAnnotation(
                                annotation,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              onPressed: () => push(
                                context,
                                AnnotationForm(
                                  think,
                                  annotation: annotation,
                                ),
                              ),
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
      ),
    );
  }

  _onClickDeleteAnnotation(Annotation annotation) {
    alert(
      context,
      "Você tem certeza ?",
      "Esse pensamento será deletado permanentemente.",
      callback: () {
        setState(() {
          think.annotations.remove(annotation);
        });
        state.deleteAnnotation(annotation);
      },
    );
  }
}
