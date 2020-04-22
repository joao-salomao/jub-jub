import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page, {bool replace = false}) {
  if (replace) {
    return Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return page;
  }));
}

pop(BuildContext context) async => Navigator.of(context).pop();
