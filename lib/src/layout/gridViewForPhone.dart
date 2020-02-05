import 'package:flutter/material.dart';
import '../plane/XYPlane.dart';
import '../plane/XZPlane.dart';
import '../plane/ZYPlane.dart';


class GridViewForPhone extends StatelessWidget {
  double x;
  double y;
  double z;
  double g;
  int hz;
  int hzMax;
  int hzMin;
  final startWatch;

  GridViewForPhone({
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.play_arrow, color: Colors.black,),
              onPressed: startWatch,
            ),
          ],
          centerTitle: true,
          title: Text(
            'SISMIC', 
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
              color: Colors.grey
            ),
            tabs: <Widget>[
              Tab(
                text: "X : Y",
              ),
              Tab(
                text: "X : Z",
              ),
              Tab(
                text: "Z : Y",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            XYPlane( 
              room: RoomXY(),
              x: this.x,
              y: this.y,
              g: this.g,
              hz: this.hz,
              hzMax: this.hzMax,
              hzMin: this.hzMin,
            ),
            XZPlane( 
              room: RoomXZ(),
              x: this.x,
              z: this.z,
              g: this.g,
              hz: this.hz,
              hzMax: this.hzMax,
              hzMin: this.hzMin,
            ),
            ZYPlane( 
              room: RoomZY(),
              z: this.z,
              y: this.y,
              g: this.g,
              hz: this.hz,
              hzMax: this.hzMax,
              hzMin: this.hzMin,
            ),
          ]
        ),
      ),
    );
  }
}