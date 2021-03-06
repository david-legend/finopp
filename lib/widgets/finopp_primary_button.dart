import 'package:finop/const/_const.dart';
import 'package:finop/const/color_const.dart';
import 'package:flutter/material.dart';

class FinoppPrimaryButton extends StatelessWidget {
  final String title;
  final double width;
  final double borderWidth;
  final double radius;
  final TextStyle buttonTextStyle;
  final double buttonPadding;
  final IconData buttonIcon;
  final double buttonIconSize;
  final Color buttonIconColor;
  final Color color;
  final Color borderColor;
  final Function action;

  FinoppPrimaryButton({
    this.title = StringConst.PROCEED,
    this.width = 30.0,
    this.borderWidth = 0.0,
    this.radius = 30.0,
    this.buttonTextStyle = proceedButtonStyle,
    this.buttonPadding = 14.0,
    this.buttonIcon,
    this.buttonIconSize = 18.0,
    this.buttonIconColor = Colors.white,
    this.color = kFINOP_PRIMARY,
    this.borderColor = kFINOP_PRIMARY,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ButtonTheme(
        minWidth: width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(
            width: borderWidth,
            color: borderColor,
          ),
        ),
        child: RaisedButton(
          onPressed: () => action(),
          color: color,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(buttonPadding),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: buttonTextStyle,
                    ),
                  ),
                  buttonIcon != null ? Icon(buttonIcon, color: buttonIconColor, size: buttonIconSize,) : Container(),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
