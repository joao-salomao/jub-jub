import 'package:flutter/material.dart';
class AppAlertDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final Function onClose;
  final Function onSave;
  AppAlertDialog({
    @required this.title,
    @required this.content,
    @required this.onClose,
    @required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 30,
                ),
                onPressed: () => onClose(),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(
                icon: Icon(
                  Icons.save,
                  size: 30,
                ),
                onPressed: () => onSave(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
