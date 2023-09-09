import 'package:flutter/material.dart';
import 'dart:math';

class CircleProg extends CustomPainter {
  final StrokeCircle = 15.0;
  double currentProg;

  CircleProg(this.currentProg);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint circle = Paint()
      ..strokeWidth = StrokeCircle
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 40;
    canvas.drawCircle(center, radius, circle);

    Paint animationArc = Paint()
      ..strokeWidth = StrokeCircle
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (currentProg / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2,
        angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
