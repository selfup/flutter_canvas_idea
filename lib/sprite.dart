import 'package:flutter/material.dart';

class Sprite {
  Paint paint;

  final double xPos;
  final double yPos;
  final Color color;

  Sprite(this.xPos, this.yPos, this.color) {
    paint = Paint()
      ..color = color
      ..strokeWidth = 10.0
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
  }
}
