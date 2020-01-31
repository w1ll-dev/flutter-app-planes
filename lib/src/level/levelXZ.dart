import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:levelApp/src/graphic/graphicXY.dart';
import '../drawing/circleMachine.dart';
import 'package:levelApp/src/drawing/circleXZ.dart';

class RoomXZ {}

class LevelXZ extends StatefulWidget {
  final RoomXZ room;
  double x = 0.0;
  double z = 0.0;
  double g;
  int hz;
  int hzMax;
  int hzMin;

  LevelXZ({
    @required  
    this.room, 
    this.x, 
    this.z,
    this.g,
    this.hz,
    this.hzMax,
    this.hzMin,
  }) : assert(room != null);

  @override
  _LevelXZState createState() => _LevelXZState();
}

class _LevelXZState extends State<LevelXZ> {
  double x = 0.0; 
  double z = 0.0;


  @override
  Widget build(BuildContext context) {

    //This hight should be known or calculated for the Widget need to be moved
    const double markerHight = 50.0;

    double ymax = context.findRenderObject()?.paintBounds?.bottom ?? markerHight ;


    return SizedBox(
      child: GestureDetector(
        onPanUpdate: (p) {
          setState(() {
            x += p.delta.dx;
            z = (z+p.delta.dy) >ymax - markerHight ? ymax -markerHight : z+p.delta.dy;

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
                    image: AssetImage('assets/images/FRONT.png'),
                  ),
                  CustomPaint(
                    painter: CircleXZ(
                      x: widget.x,
                      z: widget.z
                    ),
                    child: Container(),
                  ),
                  Stack(
                    alignment: Alignment(0.0, 0.0),
                    children: <Widget>[
                      Marker(
                        x: widget.x,
                        z: widget.z,
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
  final double x;
  final double z;

  Marker({this.x: 500.0, this.z: 500.0,});

  @override
  Widget build(BuildContext context) {
    print("x: $x, z: $z");
    return Transform(
      transform: Matrix4.translationValues(x, z, 0.0), 
      child: CustomPaint(
        painter: CircleMachine(),
        child: Container(),
      )
    );
  }
}