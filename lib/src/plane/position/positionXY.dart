import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './drawing/circleMachine.dart';
import './drawing/circleXY.dart';

class PositionXY extends StatelessWidget {
  double x;
  double y;
  double g;

  PositionXY({
    this.x,
    this.y,
    this.g,
  });
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0, 0),
      children: <Widget>[
        Image(
          image: AssetImage('assets/images/TOP.png'),
        ),
        Stack(
          alignment: Alignment(0, 0),
          children: <Widget>[
            CustomPaint(
              painter: CircleXY(
                x: this.x,
                y: this.y,
              ),
              child: Center(),
            ),
            Marker(
              x: this.x,
              y: this.y,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "${(this.g).toStringAsPrecision(2)}",
              style: TextStyle(
                fontFamily: 'Quebec Black', 
                fontSize: 40.0
              ),
            ),
            Text(
              "G",
              style: TextStyle(
                fontFamily: 'Quebec Black',
                color: Colors.lightBlue, 
                fontSize: 40.0
              ),
            ),
          ],
        ),
      ]
    );
  }
}

class Marker extends StatelessWidget {
  final double x;
  final double y;

  Marker({this.x: 0.0, this.y: 0.0,});

  @override
  Widget build(BuildContext context) {
    print("x: $x, y: $y");
    return Transform(
      
      transform: Matrix4.translationValues(x, y, 0.0), 
      // child: CircleAvatar(radius: 100, backgroundColor: Colors.lightGreen,));
      child: CustomPaint(
        painter: CircleMachine(),
        child: Center(),
      )
    );
  }
}