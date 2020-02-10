import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './drawing/circleMachine.dart';
import './drawing/xzLimit.dart';

class XZPosition extends StatelessWidget {
  double x;
  double z;
  double g;

  XZPosition({
    this.x,
    this.z,
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
              painter: CircleXZ(
                x: this.x,
                z: this.z,
              ),
              child: Center(),
            ),
            Marker(
              x: this.x,
              z: this.z,
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
  final double z;

  Marker({this.x: 0.0, this.z: 0.0,});

  @override
  Widget build(BuildContext context) {
    print("x: $x, z: $z");
    return Transform(
      
      transform: Matrix4.translationValues(x, z, 0.0), 
      child: CustomPaint(
        painter: CircleMachine(),
        child: Center(),
      )
    );
  }
}