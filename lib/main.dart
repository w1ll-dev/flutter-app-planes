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
      theme: ThemeData(primaryColor: Colors.red),
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

  startWatch() {
    watch.start();
    timer = Timer.periodic(Duration(milliseconds: 10), randomPositions);
  }

  randomPositions(Timer timer) {
    var rng = Random(); 
    setState((){
      x = (rng.nextInt(30) - 15) - rng.nextDouble();
      y = (rng.nextInt(60) - 30) - rng.nextDouble();
      z = (rng.nextInt(30) - 15) - rng.nextDouble();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: startWatch,
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: stopWatch,
            ),
          ],
          centerTitle: true,
          title: Text('SISMIC'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "X : Y",
                // icon: Icon(Icons.account_box),
              ),
              Tab(
                text: "X : Z",
                // icon: Icon(Icons.account_box),
              ),
              Tab(
                text: "Z : Y",
                // icon: Icon(Icons.account_box),
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
            ),
            LevelXZ( 
              room: RoomXZ(),
              x: this.x,
              z: this.z,
            ),
            LevelZY( 
              room: RoomZY(),
              z: this.z,
              y: this.y,
            ),
          ]
        ),
      ),
    );
  }
}