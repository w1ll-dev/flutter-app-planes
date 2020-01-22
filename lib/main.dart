import 'dart:math';

import 'package:flutter/material.dart';
import './src/level/level_x_y.dart';
import './src/level/level_x_z.dart';
import './src/level/level_y_z.dart';
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

  startWatch() {
    watch.start();
    timer = Timer.periodic(Duration(milliseconds: 10), randomPositions);
  }

  stopWatch() {
    watch.stop();
  }

  randomPositions(Timer timer){
    var rng = Random(); 
    setState((){
      x = rng.nextInt(20) + rng.nextDouble();
      y = rng.nextInt(20) + rng.nextDouble();
      z = rng.nextInt(20) + rng.nextDouble();
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
              onPressed: () {
                startWatch();
              },
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: () {
                stopWatch();
              },
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
                text: "Y : Z",
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
            LevelYZ( 
              room: RoomYZ(),
            ),
            // FloatingActionButton(
            //   onPressed: randomPositions(),
            // )
          ]
        ),
      ),
    );
  }
}