import 'package:flutter/material.dart';
import '../plane/xyPlane.dart';
import '../plane/xzPlane.dart';
import '../plane/zyPlane.dart';

class GridViewForTablet extends StatelessWidget {
  double x;
  double y;
  double z;
  double g;
  int hz;
  int hzMax;
  int hzMin;
  dynamic startWatch;

  GridViewForTablet({
    this.x,
    this.y,
    this.z,
    this.g,
    this.hz,
    this.hzMax,
    this.hzMin,
    this.startWatch,
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
        // action button
          IconButton(
            icon: Icon(Icons.play_arrow, color: Colors.black,),
            onPressed: startWatch
          ),
        ],
        centerTitle: true,
        title: Text(
          'SISMIC', 
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: LevelXY( 
              room: RoomXY(),
              x: this.x,
              y: this.y,
              g: this.g,
              hz: this.hz,
              hzMax: this.hzMax,
              hzMin: this.hzMin,
            ),
          ),
          Expanded(
            child: LevelXZ( 
              room: RoomXZ(),
              x: this.x,
              z: this.z,
              g: this.g,
              hz: this.hz,
              hzMax: this.hzMax,
              hzMin: this.hzMin,
            ),
          ),
          Expanded(
            child: LevelZY( 
              room: RoomZY(),
              z: this.z,
              y: this.y,
              g: this.g,
              hz: this.hz,
              hzMax: this.hzMax,
              hzMin: this.hzMin,
            ),
          ),
        ],
      ),
    );
  }
}