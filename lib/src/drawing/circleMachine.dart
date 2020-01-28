import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class CircleMachine extends CustomPainter{
  @override
  void paint(ui.Canvas canvas, ui.Size size ) {
    Paint paint = Paint();
    paint.color = Colors.blue[200];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = size.width/35;

    for(int i=0; i<36; i++){
      canvas.drawArc(Offset(55, 60)
      & Size(300, 300), (-90.0 + i*10)*0.0174533, 8*0.0174533,
          false, paint..color = paint.color);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  CircleMachine();
}