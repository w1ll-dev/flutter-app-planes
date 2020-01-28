import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class CircleXZ extends CustomPainter{
  double x;
  double z;

  @override
  void paint(ui.Canvas canvas, ui.Size size ) {
    Paint paint = Paint();
    paint.color = Colors.lightGreenAccent[700];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = size.width/35;
    if(x >= 13 || x <= -13){
      if(x > 13){
        paint.color = Colors.red;
      }else if(z != 0){
        paint.color = Colors.red;
      }
    }
    if(z >= 13 || z <= -13){
      if(z > 13){
        paint.color = Colors.red;
      }else if(z != 0){
        paint.color = Colors.red;
      }
    }
    for(int i=0; i<36; i++){
      canvas.drawArc(Offset(30, 35)
      & Size(350, 350), (-90.0 + i*10)*0.0174533, 8*0.0174533,
        false, paint..color = paint.color
      );
    }
    print('x : $x // y : $z');
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  CircleXZ({this.x, this.z});
}




