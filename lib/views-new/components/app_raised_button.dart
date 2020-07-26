import 'package:flutter/material.dart';

class AppRaisedButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final bool isLoading;
  final Color color;

  AppRaisedButton(this.label, {this.onPressed, this.isLoading = false, this.color});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              label,
            ),
      onPressed: onPressed,
      textColor: Colors.white,
      color: color ?? Colors.black,
    );
  }
}
