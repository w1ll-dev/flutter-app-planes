import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class CircleZY extends CustomPainter{
  double z;
  double y;

  @override
  void paint(ui.Canvas canvas, ui.Size size ) {
    Paint paint = Paint();
    paint.color = Colors.lightGreenAccent[700];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = size.width/35;
    if(z >= 13 || z <= -13){
      if(z > 13){
        paint.color = Colors.red;
      }else if(y != 0){
        paint.color = Colors.red;
      }
    }
    if(y >= 13 || y <= -13){
      if(y > 13){
        paint.color = Colors.red;
      }else if(y != 0){
        paint.color = Colors.red;
      }
    }
    for(int i=0; i<36; i++){
      canvas.drawArc(Offset(30, 35)
      & Size(350, 350), (-90.0 + i*10)*0.0174533, 8*0.0174533,
        false, paint..color = paint.color
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  CircleZY({this.z, this.y});
}




