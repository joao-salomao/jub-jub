import 'package:flutter/material.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/models/think_model.dart';
import 'package:potato_notes/views/widgets/app_text.dart';
import 'package:potato_notes/models/annotation_model.dart';
import 'package:potato_notes/views/annotation/annotation_page.dart';
import 'package:potato_notes/controllers/annotation_controller.dart';

class AnnotationCard extends StatelessWidget {
  final Key key;
  final AnnotationModel annotation;
  final ThinkModel think;
  final AnnotationController annotationController;

  AnnotationCard(
    this.key,
    this.annotation,
    this.think,
    this.annotationController,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: () => push(
          context,
          AnnotationPage(
            annotation,
            think,
            annotationController,
          ),
        ),
        child: Card(
          color: annotation.color,
          elevation: 10,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  annotation.title,
                  bold: true,
                  fontSize: 18,
                ),
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
                          AppText("${annotation.getAnnotationTotalWords()}"),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
