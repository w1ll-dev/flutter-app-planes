import 'package:flutter/material.dart';
import '../plane/position/positionXY.dart';
import '../plane/frequency/frequencyXY.dart';

class RoomXY {}

class LevelXY extends StatefulWidget {
  
  final RoomXY room;
  double x;
  double y;
  double g;
  int hz;
  int hzMax;
  int hzMin;

  LevelXY({
    @required 
    this.room, 
    this.x, 
    this.y,
    this.g,
    this.hz,
    this.hzMax,
    this.hzMin
  }) : assert(room != null);

  @override
  _LevelXYState createState() => _LevelXYState();
}

class _LevelXYState extends State<LevelXY> {
  double x = 0.0;
  double y = 0.0;

  positioXY(){
    return PositionXY(
      x: widget.x,
      y: widget.y,
      g: widget.g,
    );
  }

  frequencyXY(){
    return FrequencyXY(
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
            x += p.delta.dx;
            y = (y + p.delta.dy) >ymax - markerHight ? ymax - markerHight : y + p.delta.dy;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            positioXY(),
            frequencyXY(),
          ],
        ),
      ),
    );
  }
}
