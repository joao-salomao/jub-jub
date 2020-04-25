import 'package:flutter/material.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/utils/date.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/views/think/think_page.dart';
import 'package:potato_notes/views/widgets/app_text.dart';

class ThinkCard extends StatefulWidget {
  final Key key;
  final Think think;

  ThinkCard(this.key, this.think);

  @override
  _ThinkCard createState() => _ThinkCard();
}

class _ThinkCard extends State<ThinkCard> {
  String get createdAt => formatDate(widget.think.createdAt);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 10,
        color: widget.think.color,
        child: InkWell(
          splashColor: Colors.white,
          onTap: () => push(
            context,
            ThinkPage(widget.think),
          ),
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AppText(
                  widget.think.title,
                  fontSize: 20,
                  bold: true,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.format_align_center,
                              color: Colors.white,
                            ),
                          ),
                          AppText("${widget.think.annotations.length}"),
                        ],
                      ),
                      AppText("~ $createdAt"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
