import 'package:finop/const/color_const.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class SetupSteps extends StatefulWidget {
  final IconData icon;
  final double iconSize;
  final double height;
  final double width;
  final double iconPadding;
  final Color iconColor;
  final Color bulbColor;
  final Color linkColor;
  final BoxShape bulbShape;
  final int numberOfBulbs;
  final int activeStep;

  SetupSteps({
    this.icon = Icons.check,
    this.iconSize = 15.0,
    this.height = 30.0,
    this.width = 30.0,
    this.iconPadding = 2.0,
    this.iconColor = kFINOP_WHITE,
    this.bulbColor = kFINOP_SECONDARY,
    this.linkColor = kFINOP_SECONDARY,
    this.bulbShape = BoxShape.circle,
    this.numberOfBulbs = 3,
    this.activeStep = 1,
  });

  @override
  _SetupStepsState createState() => _SetupStepsState();
}

class _SetupStepsState extends State<SetupSteps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          ...buildSteps(),
        ],
      ),
    );
  }

  List<Widget> buildSteps() {
    int numberOfLinks = widget.numberOfBulbs - 1;
    int total = widget.numberOfBulbs + numberOfLinks;
    List<Widget> steps = <Widget>[];
    for(int i = 1; i <= total; i++ ){
      if(i.isOdd){
        steps.add(bulb(step: i));
      } else if (i.isEven) {
        steps.add(link(step: i));
      }
    }
    return steps;
  }

  Widget bulb({int step}) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        shape: widget.bulbShape,
        color: step <= widget.activeStep ? widget.bulbColor : Colors.grey,
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.iconPadding),
        child: Icon(
          widget.icon,
          size: widget.iconSize,
          color: widget.iconColor,
        ),
      ),
    );
  }

  Widget link({int step}) {
    Color color = step <= widget.activeStep ? widget.linkColor : Colors.grey;
    return CustomPaint(
      size: Size(widget.width + 20, widget.height),
      painter: MyPainter(color),
    );
  }


}
class MyPainter extends CustomPainter {
  MyPainter(this.color);

  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(0, size.height/2);
    final p2 = Offset(50, size.height/2);
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}