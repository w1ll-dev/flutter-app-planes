import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:levelApp/src/drawing/circleMachine.dart';
import 'package:levelApp/src/drawing/circleXY.dart';
import '../drawing/circleXY.dart';
import 'package:dotted_border/dotted_border.dart';

class RoomXY {}

class LevelXY extends StatefulWidget {
  final RoomXY room;
  double x;
  double y;
  double g;
  int hz;
  int hzMax;
  int hzMin;

  LevelXY({
    @required 
    this.room, 
    this.x, 
    this.y,
    this.g,
    this.hz,
    this.hzMax,
    this.hzMin
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
                      y: widget.y,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "${(widget.g).toStringAsPrecision(2)}",
                            style: TextStyle(
                              fontFamily: 'Quebec Black', 
                              fontSize: 40.0
                            ),
                          ),
                          Text(
                            "G",
                            style: TextStyle(
                              fontFamily: 'Quebec Black',
                              color: Colors.lightBlue, 
                              fontSize: 40.0
                            ),
                          ),
                        ],
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20.0,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "${widget.hzMax}",
                            style: TextStyle(
                              fontFamily: 'Quebec Black',
                              fontSize: 15.0
                            ),
                          ),
                          Text(
                            "Hz",
                            style: TextStyle(
                              color: Colors.lightBlue, 
                              fontFamily: 'Quebec Black', 
                              fontSize: 15.0
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: DottedBorder(
                      dashPattern: [3],
                      borderType: BorderType.Rect,
                      color: Colors.grey,
                      strokeWidth: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: <Widget>[
                          Text(
                            "${widget.hz}",
                            style: TextStyle(
                              fontFamily: 'Quebec Black',
                              fontSize: 40.0
                            ),
                          ),
                          Text(
                            "Hz",
                            style: TextStyle(
                              color: Colors.lightBlue, 
                              fontFamily: 'Quebec Black', 
                              fontSize: 40.0
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20.0,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${widget.hzMin}",
                            style: TextStyle(
                              fontFamily: 'Quebec Black',
                              fontSize: 15.0
                            ),
                          ),
                          Text(
                            "Hz",
                            style: TextStyle(
                              color: Colors.lightBlue, 
                              fontFamily: 'Quebec Black', 
                              fontSize: 15.0
                            ),
                          ),
                        ],
                      ),
                    ),
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