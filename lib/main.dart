import 'dart:math';
import 'package:flutter/material.dart';
import 'package:levelApp/src/layout/gridViewForTablet.dart';
import './src/layout/gridViewForPhone.dart';
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
  int hz = 21;
  int hzMax = 21;
  int hzMin = 21;
  int i = 0;

  randomPositions(Timer timer) {
    var rng = Random();
    setState(() {
      x = rng.nextInt(20).toDouble();
      y = rng.nextInt(20).toDouble();
      z = rng.nextInt(20).toDouble();
      g = (rng.nextDouble() + 2);
      hz = (rng.nextInt(4) + 20);
      setHzMax(hz);
      setHzMin(hz);
    });
  }
  
  // StopWatch Functions
  startWatch() {
    watch.start();
    timer = Timer.periodic(Duration(milliseconds: 100), randomPositions);
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

  gridViewForPhone(){
    return GridViewForPhone(
      x: this.x,
      y: this.y,
      z: this.z,
      g: this.g,
      hz: this.hz,
      hzMax: this.hzMax,
      hzMin: this.hzMin,
      startWatch: startWatch,
    );
  }
  gridViewForTablet(){
    return GridViewForTablet(
      x: this.x,
      y: this.y,
      z: this.z,
      g: this.g,
      hz: this.hz,
      hzMax: this.hzMax,
      hzMin: this.hzMin,
      startWatch: startWatch,
    );
  }


  @override
  Widget build(BuildContext context) {
    final double shortestSlide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSlide < 600;

    return useMobileLayout ? gridViewForPhone() : gridViewForTablet();
  }
}