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
  Stopwatch watch = Stopwatch();
  Timer timer;

  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double g = 2.4;
  int hz = 600;
  int hzMax = 600;
  int hzMin = 550;
  int i = 0;

  randomPositions(Timer timer) {
    var rng = Random();
    switch (this.i) {
      case 0:
        setState(() {
          x = (15).toDouble();
          y = (0 ).toDouble();
          z = (15).toDouble();
          g = (rng.nextDouble() + 2);
          hz = (rng.nextInt(160) + 500);
          setHzMax(hz);
          setHzMin(hz);
        });
        break;
      case 1:
        setState(() {
          x = (0).toDouble();
          y = (15).toDouble();
          z = (0).toDouble();
          g = (rng.nextDouble() + 2);
          hz = (rng.nextInt(160) + 500);
          setHzMax(hz);
          setHzMin(hz);
        });
        break;
      case 0:
        setState(() {
          x = (-15).toDouble();
          y = (0 ).toDouble();
          z = (-15).toDouble();
          g = (rng.nextDouble() + 2);
          hz = (rng.nextInt(160) + 500);
          setHzMax(hz);
          setHzMin(hz);
        });
        break;
      case 0:
        setState(() {
          x = (0).toDouble();
          y = (-15).toDouble();
          z = (0).toDouble();
          g = (rng.nextDouble() + 2);
          hz = (rng.nextInt(160) + 500);
          setHzMax(hz);
          setHzMin(hz);
        });
        break;
      default:
    }
    if(i == 4){
      setState(() {
        i = 0;
      });
    }else{
      i++;
    }
  }
  //StopWatch Functions
  startWatch() {
    watch.start();
    timer = Timer.periodic(Duration(milliseconds: 800), randomPositions);
  }

  resetWatch(){
    initPosition();
    watch.reset();
  }
  
  initPosition(){
    setState(() {
      x = 0.0;
      y = 0.0;
      z = 0.0;
      g = 2.4;
      hz = 600;
      hzMax = 600;
      hzMin = 600;
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
              onPressed: startWatch
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
              hzMax: this.hzMax,
              hzMin: this.hzMin,
            ),
            LevelZY( 
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