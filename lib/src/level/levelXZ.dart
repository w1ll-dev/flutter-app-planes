import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:levelApp/src/drowing/circleXZ.dart';

class RoomXZ {}

class LevelXZ extends StatefulWidget {
  final RoomXZ room;
  double x = 0.0;
  double z = 0.0;

  LevelXZ({
    @required this.room, this.x, this.z
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
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomPaint(
                painter: CircleXZ(
                  x: widget.x,
                  z: widget.z
                ),
                child: Container(),
              ),
              Marker(
                x: widget.x,
                z: widget.z,
              ),
            ],
          ),
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
      child: CircleAvatar(radius: 150, backgroundColor: Colors.lightGreen,));
  }
}