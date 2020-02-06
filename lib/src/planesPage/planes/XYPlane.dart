import 'package:flutter/material.dart';
import './position/xyPosition.dart';
import './frequency/XYFrequency.dart';

class RoomXY {}

class XYPlane extends StatefulWidget {
  
  final RoomXY room;
  double x;
  double y;
  double g;
  int hz;
  int hzMax;
  int hzMin;

  XYPlane({
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
  _XYPlaneState createState() => _XYPlaneState();
}

class _XYPlaneState extends State<XYPlane> {
  double x = 0.0;
  double y = 0.0;

  xyPosition(){
    return XYPosition(
      x: widget.x,
      y: widget.y,
      g: widget.g,
    );
  }

  xyFrequency(){
    return XYFrequency(
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
            xyPosition(),
            xyFrequency(),
          ],
        ),
      ),
    );
  }
}
