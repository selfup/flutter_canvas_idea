import 'package:flutter/material.dart';

class Enemy extends CustomPainter {
  Paint _paint;

  final double xPos;
  final double yPos;
  final Color color;

  Enemy(this.xPos, this.yPos, this.color) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = 10.0
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(xPos, yPos), 15.00, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
