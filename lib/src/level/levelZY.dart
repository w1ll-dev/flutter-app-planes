import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../drawing/circleZY.dart';

class RoomZY {}

class LevelZY extends StatefulWidget {
  final RoomZY room;
  double z;
  double y;

  LevelZY({
    @required 
    this.room, 
    this.z, 
    this.y
  }) : assert(room != null);

  @override
  _LevelZYState createState() => _LevelZYState();
}

class _LevelZYState extends State<LevelZY> {
  double z = 0.0; // z position in parent
  double y = 0.0;

  @override
  Widget build(BuildContext context) {

    //This hight should be known or calculated for the Widget need to be moved
    const double markerHight = 50.0;

    double ymax = context.findRenderObject()?.paintBounds?.bottom ?? markerHight ;

    return Container(
      child: GestureDetector(
        onPanUpdate: (p) {
          setState(() {
            z += p.delta.dx;
            y = (y + p.delta.dy) >ymax - markerHight ? ymax - markerHight : y + p.delta.dy;
          });
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomPaint(
                painter: CircleZY(
                  z: widget.z,
                  y: widget.y
                ),
                child: Container(),
              ),
              Marker(
                z: widget.z,
                y: widget.y,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Marker extends StatelessWidget {
  final double z;
  final double y;

  Marker({this.z: 500.0, this.y: 500.0,});

  @override
  Widget build(BuildContext context) {
    print("z: $z, y: $y");
    return Transform(
      transform: Matrix4.translationValues(z, y, 0.0), 
      child: CircleAvatar(radius: 150, backgroundColor: Colors.lightGreen,));
  }
}