import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './drawing/circleMachine.dart';
import './drawing/circleZY.dart';

class PositionZY extends StatelessWidget {
  double z;
  double y;
  double g;

  PositionZY({
    this.z,
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
              painter: CircleZY(
                z: this.z,
                y: this.y,
              ),
              child: Center(),
            ),
            Marker(
              z: this.z,
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
  final double z;
  final double y;

  Marker({this.z: 0.0, this.y: 0.0, });

  @override
  Widget build(BuildContext context) {
    print("z: $z, y: $y, ");
    return Transform(
      
      transform: Matrix4.translationValues(z, y, 0.0), 
      child: CustomPaint(
        painter: CircleMachine(),
        child: Center(),
      )
    );
  }
}