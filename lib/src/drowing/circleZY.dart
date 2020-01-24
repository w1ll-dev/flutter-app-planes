import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class CircleZY extends CustomPainter{
  double z;
  double y;

  @override
  void paint(ui.Canvas canvas, ui.Size size ) {
    Paint paint = Paint();
    paint.color = Colors.blue;
    if(z > 25 || y > 35){
      paint.color = Colors.red;
    }
    // print('z : $z // y : $y');
    canvas.drawCircle(Offset(205, 150), 180, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  CircleZY({this.z, this.y});
}




