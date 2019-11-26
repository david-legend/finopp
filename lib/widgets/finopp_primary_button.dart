import 'package:finop/const/_const.dart';
import 'package:finop/const/color_const.dart';
import 'package:flutter/material.dart';

class FinoppPrimaryButton extends StatelessWidget {
  final String title;
  final double width;
  final double radius;
  final double buttonPadding;
  final Color color;
  final Function action;

  FinoppPrimaryButton({
    this.title = StringConst.PROCEED,
    this.width = 30.0,
    this.radius = 30.0,
    this.buttonPadding = 14.0,
    this.color = kFINOP_PRIMARY,
    this.action,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ButtonTheme(
        minWidth: width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: RaisedButton(
          onPressed: () => action(),
          color: color,
          child: Padding(
            padding: EdgeInsets.all(buttonPadding),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: proceedButtonStyle,
            ),
          ),
        ),
      ),
    );
  }
}

