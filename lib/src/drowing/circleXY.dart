import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class CircleXY extends CustomPainter{
  double x;
  double y;

  @override
  void paint(ui.Canvas canvas, ui.Size size ) {

    Paint paint = Paint();
    paint.color = Colors.blue;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = size.width/25;
    if(x > 20 || y > 22){
      paint.color = Colors.red;
    }
    // print('x : $x // y : $y');
    canvas.drawCircle(Offset(205, 150), 180, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  CircleXY({this.x, this.y});
}




