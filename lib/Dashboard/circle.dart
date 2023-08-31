import 'package:flutter/material.dart';
import 'dart:math';

class CircleProgress extends CustomPainter {
  final StrokeCircle = 13.0;
  double currentProgress;

  CircleProgress(this.currentProgress);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint circle = Paint()
      ..strokeWidth = StrokeCircle
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 60;
    canvas.drawCircle(center, radius, circle);

    Paint animationArc = Paint()
      ..strokeWidth = StrokeCircle
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (currentProgress / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2,
        angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
