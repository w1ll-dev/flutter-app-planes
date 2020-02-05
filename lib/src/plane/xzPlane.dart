import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../plane/position/xzPosition.dart';
import '../plane/frequency/frequencyXZ.dart';
import './position/drawing/circleMachine.dart';

class RoomXZ {}

class LevelXZ extends StatefulWidget {
  final RoomXZ room;
  double x = 0.0;
  double z = 0.0;
  double g;
  int hz;
  int hzMax;
  int hzMin;

  LevelXZ({
    @required  
    this.room, 
    this.x, 
    this.z,
    this.g,
    this.hz,
    this.hzMax,
    this.hzMin,
  }) : assert(room != null);

  @override
  _LevelXZState createState() => _LevelXZState();
}

class _LevelXZState extends State<LevelXZ> {
  double x = 0.0; 
  double z = 0.0;

  positioXZ(){
    return PositionXZ(
      x: widget.x,
      z: widget.z,
      g: widget.g,
    );
  }

  frequencyXZ(){
    return FrequencyXZ(
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


    return SizedBox(
      child: GestureDetector(
        onPanUpdate: (p) {
          setState(() {
            x += p.delta.dx;
            z = (z+p.delta.dy) >ymax - markerHight ? ymax -markerHight : z+p.delta.dy;

          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            positioXZ(),
            frequencyXZ(),
          ],
        ),
      ),
    );
  }
}

class Marker extends StatelessWidget {
  final double x;
  final double z;

  Marker({this.x: 500.0, this.z: 500.0,});

  @override
  Widget build(BuildContext context) {
    print("x: $x, z: $z");
    return Transform(
      transform: Matrix4.translationValues(x, z, 0.0), 
      child: CustomPaint(
        painter: CircleMachine(),
        child: Container(),
      )
    );
  }
}