import 'dart:async';

import 'package:flutter/material.dart';
import '../planesPage/planes/XYPlane.dart';
import '../planesPage/planes/XZPlane.dart';
import '../planesPage/planes/ZYPlane.dart';
import '../../data/data.dart' as ble;

class PlanesPagePhone extends StatefulWidget {
  @override
  _PlanesPagePhoneState createState() => _PlanesPagePhoneState();
}

class _PlanesPagePhoneState extends State<PlanesPagePhone> {
  Stopwatch watch = Stopwatch();
  Timer timer;
  
  double x = ble.randomData()[0];
  double y = ble.randomData()[1];
  double z = ble.randomData()[2];
  double g = ble.randomData()[3];
  int hz = ble.randomData()[4];
  int hzMax = ble.randomData()[5];
  int hzMin = ble.randomData()[6];

  getData(Timer timer){
    setState(() {
      x = ble.data[0];
      y = ble.data[1];
      z = ble.data[2];
      g = ble.data[3];
      hz = ble.data[4];
      hzMax = ble.data[5];
      hzMin = ble.data[6];
      print('x: $x, y: $y, z: $z');
    });
  }

  startWatch() {
    watch.start();
    timer = Timer.periodic(Duration(milliseconds: 100), getData);
  }



  // final startWatch;
  // PlanesPagePhone({
  //   this.x,
  //   this.y,
  //   this.z,
  //   this.g,
  //   this.hz,
  //   this.hzMax,
  //   this.hzMin,
  //   this.startWatch,
  // });

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


// class PlanesPagePhone extends StatelessWidget {
//   // Stopwatch watch = Stopwatch();
//   // Timer timer;
  
//   // double x = ble.data[0];
//   // double y = ble.data[1];
//   // double z = ble.data[2];
//   // double g = ble.data[3];
//   // int hz = ble.data[4];
//   // int hzMax = ble.data[5];
//   // int hzMin = ble.data[6];

//   // getData(Timer timer){
//   //   setsta
//   //   x = ble.data[0];
//   //   y = ble.data[1];
//   //   z = ble.data[2];
//   //   g = ble.data[3];
//   //   hz = ble.data[4];
//   //   hzMax = ble.data[5];
//   //   hzMin = ble.data[6];
//   //   print('x: $x, y: $y, z: $z');
//   // }

//   // startWatch() {
//   //   watch.start();
//   //   timer = Timer.periodic(Duration(milliseconds: 1000), getData);
//   // }



//   // // final startWatch;
//   // // PlanesPagePhone({
//   // //   this.x,
//   // //   this.y,
//   // //   this.z,
//   // //   this.g,
//   // //   this.hz,
//   // //   this.hzMax,
//   // //   this.hzMin,
//   // //   this.startWatch,
//   // // });

//   // PlanesPagePhone();
  
//   // @override
//   // Widget build(BuildContext context) {
//   //   return DefaultTabController(
//   //     length: 3,
//   //     child: Scaffold(
//   //       appBar: AppBar(
//   //         backgroundColor: Colors.white,
//   //         actions: <Widget>[
//   //           // action button
//   //           IconButton(
//   //             icon: Icon(Icons.play_arrow, color: Colors.black,),
//   //             onPressed: startWatch,
//   //           ),
//   //         ],
//   //         centerTitle: true,
//   //         title: Text(
//   //           'SISMIC', 
//   //           style: TextStyle(color: Colors.black),
//   //         ),
//   //         bottom: TabBar(
//   //           unselectedLabelColor: Colors.black,
//   //           indicator: BoxDecoration(
//   //             color: Colors.grey
//   //           ),
//   //           tabs: <Widget>[
//   //             Tab(
//   //               text: "X : Y",
//   //             ),
//   //             Tab(
//   //               text: "X : Z",
//   //             ),
//   //             Tab(
//   //               text: "Z : Y",
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //       body: TabBarView(
//   //         children: <Widget>[
//   //           XYPlane( 
//   //             room: RoomXY(),
//   //             x: this.x,
//   //             y: this.y,
//   //             g: this.g,
//   //             hz: this.hz,
//   //             hzMax: this.hzMax,
//   //             hzMin: this.hzMin,
//   //           ),
//   //           XZPlane( 
//   //             room: RoomXZ(),
//   //             x: this.x,
//   //             z: this.z,
//   //             g: this.g,
//   //             hz: this.hz,
//   //             hzMax: this.hzMax,
//   //             hzMin: this.hzMin,
//   //           ),
//   //           ZYPlane( 
//   //             room: RoomZY(),
//   //             z: this.z,
//   //             y: this.y,
//   //             g: this.g,
//   //             hz: this.hz,
//   //             hzMax: this.hzMax,
//   //             hzMin: this.hzMin,
//   //           ),
//   //         ]
//   //       ),
//   //     ),
//   //   );
//   // }
// }