import 'package:flutter/material.dart';

Future alert(
  BuildContext context,
  String title,
  String message, {
  Function callback,
}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  if (callback != null) {
                    callback();
                  }
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      });
}
