import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:levelApp/src/graphic/graphicXY.dart';
import '../drawing/circleMachine.dart';
import '../drawing/circleZY.dart';

class RoomZY {}

class LevelZY extends StatefulWidget {
  final RoomZY room;
  double z;
  double y;
  double g;
  int hz;
  int hzMax;
  int hzMin;

  LevelZY({
    @required 
    this.room, 
    this.z, 
    this.y,
    this.g,
    this.hz,
    this.hzMax,
    this.hzMin,
  }) : assert(room != null);

  @override
  _LevelZYState createState() => _LevelZYState();
}

class _LevelZYState extends State<LevelZY> {
  double z = 0.0; // z position in parent
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
            z += p.delta.dx;
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
                    image: AssetImage('assets/images/LAT.png'),
                  ),
                  CustomPaint(
                    painter: CircleZY(
                      z: widget.z,
                      y: widget.y
                    ),
                    child: Container(),
                  ),
                  Stack(
                    alignment: Alignment(0.0, 0.0),
                    children: <Widget>[
                      Marker(
                        z: widget.z,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    flex: 1,
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
                    child: Stack(
                      alignment: Alignment(0, 0),
                      children: <Widget>[
                        GraphicXY(),
                        Row(
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
                        
                      ]
                    ),
                  ),
                  Flexible(
                    flex: 1,
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
  final double z;
  final double y;

  Marker({this.z: 500.0, this.y: 500.0,});

  @override
  Widget build(BuildContext context) {
    print("z: $z, y: $y");
    return Transform(
      transform: Matrix4.translationValues(z, y, 0.0), 
      child: CustomPaint(
        painter: CircleMachine(),
        child: Container(),
      ) 
    );
  }
}