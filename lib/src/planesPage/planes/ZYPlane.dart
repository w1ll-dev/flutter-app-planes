import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './frequency/ZYFrequency.dart';
import './position/zyPosition.dart';
import './position/drawing/circleMachine.dart';

class RoomZY {}

class ZYPlane extends StatefulWidget {
  final RoomZY room;
  double z;
  double y;
  double g;
  int hz;
  int hzMax;
  int hzMin;

  ZYPlane({
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
  _ZYPlaneState createState() => _ZYPlaneState();
}

class _ZYPlaneState extends State<ZYPlane> {
  double z = 0.0; // z position in parent
  double y = 0.0;

  positioXY(){
    return ZYPosition(
      z: widget.z,
      y: widget.y,
      g: widget.g,
    );
  }

  zyFrequency(){
    return ZYFrequency(
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
            zyFrequency(),
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