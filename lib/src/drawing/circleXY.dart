import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class CircleXY extends CustomPainter{
  double x;
  double y;

  @override
  void paint(ui.Canvas canvas, ui.Size size ) {
    Paint paint = Paint();
    paint.color = Colors.lightGreenAccent[700];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = size.width/35;
    if(x >= 13 || x <= -13){
      if(x > 13){
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
    print('x : $x // y : $y');
    // canvas.drawCircle(Offset(205, 150), 180, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  CircleXY({this.x, this.y});
}




