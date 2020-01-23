import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class MyPainter extends CustomPainter{
  double x;
  double y;

  @override
  void paint(ui.Canvas canvas, ui.Size size ) {
    final paint = Paint()..color = Colors.blue;
    canvas.drawCircle(Offset(205, 150), 180, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}

final customPaint = CustomPaint(
  painter: MyPainter(),
  child: Container(),
);

