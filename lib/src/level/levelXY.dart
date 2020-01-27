import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:levelApp/src/drawing/circleMachine.dart';
import 'package:levelApp/src/drawing/circleXY.dart';
import '../drawing/circleXY.dart';

class RoomXY {}

class LevelXY extends StatefulWidget {
  final RoomXY room;
  double x;
  double y;

  LevelXY({
    @required 
    this.room, 
    this.x, 
    this.y
  }) : assert(room != null);

  @override
  _LevelXYState createState() => _LevelXYState();
}

class _LevelXYState extends State<LevelXY> {
  double x = 0.0;
  double y = 0.0;

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "X = ${(widget.x).toStringAsPrecision(2)}\nY = ${(widget.y).toStringAsPrecision(2)}\nG = 2.4",
                    style: TextStyle(fontSize: 20,),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 6,
              child: Stack(
                alignment: Alignment(0.0, 0.0),
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/TOP.png'),
                  ),
                  CustomPaint(
                    painter: CircleXY(
                      x: widget.x,
                      y: widget.y
                    ),
                    child: Container(),
                  ),
                  Stack(
                    alignment: Alignment(0.0, 0.0),
                    children: <Widget>[
                      Marker(
                        x: widget.x,
                        y: widget.y,
                      ),
                      Text(
                        'G = 2.4'
                      ),
                    ],
                  ),
                ],  
              ), 
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "110HZ"
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Marker extends StatelessWidget {
  final double x;
  final double y;

  Marker({this.x: 0.0, this.y: 0.0,});

  @override
  Widget build(BuildContext context) {
    print("x: $x, y: $y");
    return Transform(
      
      transform: Matrix4.translationValues(x, y, 0.0), 
      // child: CircleAvatar(radius: 100, backgroundColor: Colors.lightGreen,));
      child: CustomPaint(
        painter: CircleMachine(),
        child: Container(),
      )
    );
  }
}