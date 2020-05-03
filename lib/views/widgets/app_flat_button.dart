import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class AppFlatButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final bool isLoading;
  final Color color;

  AppFlatButton({
    @required this.child,
    this.onPressed,
    this.isLoading = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: isLoading
          ? Center(
              child: JumpingDotsProgressIndicator(
                color: Colors.white,
                fontSize: 20.0,
              ),
            )
          : child,
      onPressed: onPressed,
      textColor: Colors.white,
    );
  }
}
