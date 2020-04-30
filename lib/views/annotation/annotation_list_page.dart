import 'annotation_form.dart';
import 'annotation_file_list.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/models/think_model.dart';
import 'package:potato_notes/views/widgets/app_text.dart';
import 'package:potato_notes/models/annotation_model.dart';
import 'package:potato_notes/views/widgets/app_alert.dart';
import 'package:potato_notes/views/annotation/state/annotation_list_page_controller.dart';

class AnnotationListPage extends StatefulWidget {
  final ThinkModel think;
  AnnotationListPage(this.think);

  @override
  _AnnotationListPageState createState() => _AnnotationListPageState();
}

class _AnnotationListPageState extends State<AnnotationListPage> {
  AnnotationListPageController state;
  ThinkModel get think => widget.think;

  @override
  void initState() {
    state = AnnotationListPageController(think);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          child: ListView(
            children: List.generate(
              think.annotations.length,
              (i) {
                final annotation = think.annotations[i];
                return ExpandableNotifier(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      color: annotation.color,
                      clipBehavior: Clip.antiAlias,
                      elevation: 10,
                      child: Column(
                        children: <Widget>[
                          ScrollOnExpand(
                            scrollOnExpand: true,
                            scrollOnCollapse: false,
                            child: ExpandablePanel(
                              theme: ExpandableThemeData(
                                tapBodyToCollapse: true,
                                iconColor: Colors.white,
                              ),
                              header: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  annotation.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              collapsed: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        annotation.text,
                                        softWrap: true,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          child: Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 3),
                                                child: Icon(
                                                  Icons.local_parking,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              AppText(
                                                  "${annotation.getAnnotationTotalWords()}"),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 3),
                                                child: Icon(
                                                  Icons.filter,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              AppText(
                                                  "${annotation.getAnnotationFilesCountByType("image")}"),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          child: Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 3),
                                                child: Icon(
                                                  Icons.video_library,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              AppText(
                                                  "${annotation.getAnnotationFilesCountByType("video")}"),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          child: Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 3),
                                                child: Icon(
                                                  Icons.audiotrack,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              AppText(
                                                  "${annotation.getAnnotationFilesCountByType("audio")}"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                          onPressed: () =>
                                              _onClickDeleteAnnotation(
                                            annotation,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            push(
                                              context,
                                              AnnotationForm(
                                                think,
                                                annotation: annotation,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              expanded: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: AnnotationFileList(
                                      annotation,
                                    ),
                                  ),
                                  Container(
                                    child: AppText(
                                      annotation.text,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: AppText(
                                      "~ ${annotation.createdAt}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        onPressed: () =>
                                            _onClickDeleteAnnotation(
                                          annotation,
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            push(
                                              context,
                                              AnnotationForm(
                                                think,
                                                annotation: annotation,
                                              ),
                                            );
                                          }),
                                    ],
                                  )
                                ],
                              ),
                              builder: (_, collapsed, expanded) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    bottom: 10,
                                  ),
                                  child: Expandable(
                                    collapsed: collapsed,
                                    expanded: expanded,
                                    theme: const ExpandableThemeData(
                                      crossFadePoint: 0,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  _onClickDeleteAnnotation(AnnotationModel annotation) {
    alert(
      context,
      "Você tem certeza ?",
      "Essa anotação será deletada permanentemente.",
      callback: () {
        state.deleteAnnotation(annotation);
      },
    );
  }
}
