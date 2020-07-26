import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class AppFlatButton extends StatelessWidget {
  final Color color;
  final Widget child;
  final bool isLoading;
  final Color loaderColor;
  final Function onPressed;

  AppFlatButton({
    @required this.child,
    this.color,
    this.onPressed,
    this.loaderColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: isLoading
          ? Center(
              child: JumpingDotsProgressIndicator(
                color: loaderColor ?? Colors.white,
                fontSize: 20.0,
              ),
            )
          : child,
      onPressed: onPressed,
      textColor: Colors.white,
    );
  }
}
