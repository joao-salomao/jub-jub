import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato_notes/models/annotation_model.dart';
import 'package:potato_notes/models/think_model.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/views/annotation/annotation_file_list.dart';
import 'package:potato_notes/views/annotation/annotation_form.dart';
import 'package:potato_notes/views/widgets/app_text.dart';

class AnnotationCard extends StatelessWidget {
  final Key key;
  final AnnotationModel annotation;
  final ThinkModel think;
  final Function onClickDeleteAnnotation;
  
  AnnotationCard(
    this.key,
    this.annotation,
    this.think,
    this.onClickDeleteAnnotation,
  );

  @override
  Widget build(BuildContext context) {
    final Widget footer = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          onPressed: () => onClickDeleteAnnotation(
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
    );

    return Observer(
      builder: (_) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 3),
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
                                        margin: EdgeInsets.only(right: 3),
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
                                        margin: EdgeInsets.only(right: 3),
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
                                        margin: EdgeInsets.only(right: 3),
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
                            footer,
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
                          footer,
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
    );
  }
}
