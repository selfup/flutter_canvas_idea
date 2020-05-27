import 'package:flutter/material.dart';
import 'sprite.dart';

class Entity extends CustomPainter {
  final List<Sprite> sprites;

  Entity(this.sprites);

  @override
  void paint(Canvas canvas, Size size) {
    sprites.forEach((sprite) {
      canvas.drawCircle(Offset(sprite.xPos, sprite.yPos), 15.00, sprite.paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
