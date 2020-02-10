// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:levelApp/src/layout/gridViewForTablet.dart';
// import 'package:levelApp/src/pages/bluetoothPage/bluetoothPagePhone.dart';
import './src/layout/gridViewForPhone.dart';

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
  // gridViewForPhone(){
  //   return GridViewForPhone();
  // }
  // gridViewForTablet(){
  //   return GridViewForTablet();
  // }


  @override
  Widget build(BuildContext context) {
    final double shortestSlide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSlide < 600;

    // return useMobileLayout ? BluetoothPagePhone() : GridViewForTablet();
    return useMobileLayout ? GridViewForPhone() : GridViewForTablet();
    // return useMobileLayout ? gridViewForPhone() : gridViewForTablet();
  }
}