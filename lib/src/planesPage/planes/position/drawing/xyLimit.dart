import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class CircleXY extends CustomPainter{
  double x;
  double y;

  CircleXY({this.x, this.y});

  @override
  void paint(ui.Canvas canvas, ui.Size size ) {
    Paint paint = Paint();
    paint.color = Colors.lightGreenAccent[700];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = size.width/35;
    var center = Offset(size.width / 2, size.height / 2);

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
      canvas.drawArc(
        Rect.fromCircle(center: center,radius: size.width / (5/2)),
        (-90.0 + i*10)*0.0174533, 8*0.0174533,
        false,
        paint
      );
    }
  }

  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}




