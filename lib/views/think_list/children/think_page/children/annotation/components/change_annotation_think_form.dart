import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:jubjub/models/annotation_model.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:jubjub/utils/navigation.dart';
import 'package:jubjub/views/components/app_alert_dialog.dart';

import '../../../think_page.dart';

class ChangeAnnotationThinkForm extends StatefulWidget {
  final ThinkModel think;
  final AnnotationModel annotation;

  ChangeAnnotationThinkForm(this.think, this.annotation);

  @override
  _ChangeAnnotationThinkFormState createState() =>
      _ChangeAnnotationThinkFormState();
}

class _ChangeAnnotationThinkFormState extends State<ChangeAnnotationThinkForm> {
  ThinkModel selectedThink;
  List<ThinkModel> thinks;
  final appController = GetIt.I<AppController>();

  ThinkModel get think => widget.think;
  AnnotationModel get annotation => widget.annotation;

  @override
  void initState() {
    selectedThink = widget.think;
    thinks = appController.thinks.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
      title: "Selecione a nova pasta",
      content: Container(
        child: DropdownButton<ThinkModel>(
          value: selectedThink,
          icon: Icon(
            Icons.arrow_downward,
          ),
          selectedItemBuilder: (context) {
            return thinks.map((item) {
              return Container(
                width: MediaQuery.of(context).size.width * .6,
                child: Text(
                  item.title,
                ),
              );
            }).toList();
          },
          iconSize: 25,
          elevation: 16,
          underline: Container(
            height: 2,
            color: widget.annotation.color,
          ),
          onChanged: (newValue) {
            setState(() {
              selectedThink = newValue;
            });
          },
          items: thinks.map<DropdownMenuItem<ThinkModel>>(
            (item) {
              return DropdownMenuItem<ThinkModel>(
                value: item,
                child: Text(item.title),
              );
            },
          ).toList(),
        ),
      ),
      onClose: () => pop(context),
      onSave: () {
        if (annotation.thinkId == selectedThink.id) {
          pop(context);
          return;
        }
        appController.updateAnnotationThink(annotation, selectedThink).then(
          (value) {
            pop(context);
            pop(context);
            pop(context);

            push(
              context,
              ThinkPage(
                appController.thinks.firstWhere(
                  (item) => item.id == selectedThink.id,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
