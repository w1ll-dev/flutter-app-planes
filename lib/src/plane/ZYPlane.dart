import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../plane/frequency/frequencyZY.dart';
import '../plane/position/positionZY.dart';
import './position/drawing/circleMachine.dart';

class RoomZY {}

class LevelZY extends StatefulWidget {
  final RoomZY room;
  double z;
  double y;
  double g;
  int hz;
  int hzMax;
  int hzMin;

  LevelZY({
    @required 
    this.room, 
    this.z, 
    this.y,
    this.g,
    this.hz,
    this.hzMax,
    this.hzMin,
  }) : assert(room != null);

  @override
  _LevelZYState createState() => _LevelZYState();
}

class _LevelZYState extends State<LevelZY> {
  double z = 0.0; // z position in parent
  double y = 0.0;

  positioXY(){
    return PositionZY(
      z: widget.z,
      y: widget.y,
      g: widget.g,
    );
  }

  frequencyXY(){
    return FrequencyZY(
      hz: widget.hz,
      hzMax: widget.hzMax,
      hzMin: widget.hzMin,
    );
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            positioXY(),
            frequencyXY(),
          ]
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
      child: CustomPaint(
        painter: CircleMachine(),
        child: Container(),
      ) 
    );
  }
}