import 'package:flutter/material.dart';
import 'package:jubjub/utils/formatters.dart';
import 'package:jubjub/utils/navigation.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jubjub/views/think/think_page.dart';
import 'package:jubjub/views/widgets/app_text.dart';

class ThinkCard extends StatelessWidget {
  final Key key;
  final ThinkModel think;
  ThinkCard(this.key, this.think);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          padding: EdgeInsets.all(5),
          child: Card(
            elevation: 10,
            color: think.color,
            child: InkWell(
              splashColor: Colors.white,
              onTap: () => push(
                context,
                ThinkPage(think),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    AppText(
                      think.title,
                      fontSize: 16,
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
                              AppText("${think.annotations.length}"),
                            ],
                          ),
                          AppText("~ ${formatDate(think.createdAt)}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
