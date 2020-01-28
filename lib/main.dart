import 'dart:math';
import 'package:flutter/material.dart';
import 'package:levelApp/src/level/levelZY.dart';
import './src/level/levelXY.dart';
import './src/level/levelXZ.dart';
import './src/level/levelZY.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SISMIC',
      theme: ThemeData(
        primaryColor: Colors.red,
        fontFamily: 'Quebec Black',  
      ),
      home: MyHomePage(title: 'SISMIC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title,}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double g = 2.4;
  int hz = 600;
  int hzMax = 600;
  int hzMin = 600;

  Stopwatch watch = Stopwatch();
  Timer timer;
  
  stopWatch(){
    watch.stop();
    setState(() {
      x = 0.0;
      y = 0.0;
      z = 0.0;
    });
  }

  setHzMax(value){
    if(value > this.hzMax){
      setState(() {
        hzMax = value;
      });
    }
  }

  setHzMin(value){
    if(value < this.hzMin){
      setState(() {
        hzMin = value;
      });
    }
  }

  startWatch() {
    watch.start();
    timer = Timer.periodic(Duration(milliseconds: 800), randomPositions);
  }

  randomPositions(Timer timer) {
    var rng = Random(); 
    setState((){
      x = (rng.nextInt(15) - 15).toDouble();
      y = (rng.nextInt(15) - 15).toDouble();
      z = (rng.nextInt(15) - 15).toDouble();
      g = (rng.nextDouble() + 2);
      hz = (rng.nextInt(25) + 600);
      setHzMax(hz);
      setHzMin(hz);
    });
  }
  
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
              onPressed: (){
                startWatch();
              }
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed:(){
                stopWatch();
              }
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
            LevelXY( 
              room: RoomXY(),
              x: this.x,
              y: this.y,
              g: this.g,
              hz: this.hz,
              hzMax: this.hzMax,
              hzMin: this.hzMin,
            ),
            LevelXZ( 
              room: RoomXZ(),
              x: this.x,
              z: this.z,
              g: this.g,
              hz: this.hz,
            ),
            LevelZY( 
              room: RoomZY(),
              z: this.z,
              y: this.y,
              g: this.g,
              hz: this.hz,
            ),
          ]
        ),
        // body: DefaultTabController(
        //   length: 3,
        //   child: Column(
        //     children: <Widget>[
        //       Container(
        //         constraints: BoxConstraints(maxHeight: 150.0),
        //         child: Material(
        //           color: Colors.white,
                  
        //           child: TabBar(
        //             tabs: [
        //               Tab(
                        
        //                 child: Container(
                          
        //                   child: Text(
        //                     "X : Y"
        //                   ),
        //                 ),
        //               ),
        //               Tab(
        //                 text: "X : Z",
        //               ),
        //               Tab(
        //                 text: "Z : Y",
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       Expanded(
        //         child: TabBarView(
        //           children: [
        //             LevelXY( 
        //               room: RoomXY(),
        //               x: this.x,
        //               y: this.y,
        //             ),
        //             LevelXZ( 
        //               room: RoomXZ(),
        //               x: this.x,
        //               z: this.z,
        //             ),
        //             LevelZY( 
        //               room: RoomZY(),
        //               z: this.z,
        //               y: this.y,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}