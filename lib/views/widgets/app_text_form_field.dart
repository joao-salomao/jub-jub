import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final bool expands;
  final int minLines;
  final int maxLines;
  final bool obscureText;
  final Color cursorColor;
  final Function onChange;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  AppTextFormField(
    this.label,
    this.hint, {
    this.minLines,
    this.onChange,
    this.validator,
    this.focusNode,
    this.nextFocus,
    this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.textInputAction,
    this.expands = false,
    this.obscureText = false,
    this.cursorColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.justify,
      cursorColor: cursorColor,
      cursorRadius: Radius.circular(16.0),
      cursorWidth: 5,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      minLines: minLines,
      maxLines: maxLines,
      expands: expands,
      onChanged: onChange,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      style: TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
