import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class MyPainter extends CustomPainter{
  @override
  void paint(ui.Canvas canvas, ui.Size size ) {
    canvas.drawCircle(Offset(75, 75), 100, Paint()); 
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