import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class CircleXZ extends CustomPainter{
  double x;
  double z;

  @override
  void paint(ui.Canvas canvas, ui.Size size ) {
    Paint paint = Paint();
    paint.color = Colors.blue;
    if(x > 25 || z > 35){
      paint.color = Colors.red;
    }
    print('x : $x // z : $z');
    canvas.drawCircle(Offset(205, 150), 180, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  CircleXZ({this.x, this.z});
}




