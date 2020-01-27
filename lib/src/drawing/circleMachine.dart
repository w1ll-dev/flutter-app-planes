import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class CircleMachine extends CustomPainter{
  @override
  void paint(ui.Canvas canvas, ui.Size size ) {
    Paint paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = size.width/25;

    for(int i=0; i<36; i++){
      canvas.drawArc(Offset(55, 20)
      & Size(200, 200), (-90.0 + i*10)*0.0174533, 8*0.0174533,
          false, paint..color = paint.color);
    }
    // if(x > 20 || y > 22){
    //   paint.color = Colors.red;
    // }
    // print('x : $x // y : $y');
    // canvas.drawCircle(Offset(205, 150), 180, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  CircleMachine();
}