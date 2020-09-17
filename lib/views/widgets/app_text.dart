import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final bool bold;
  final Color color;

  AppText(
    this.text, {
    this.fontSize = 16,
    this.textAlign = TextAlign.left,
    this.bold = false,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize,
          color: color,
        ),
      ),
    );
  }
}
