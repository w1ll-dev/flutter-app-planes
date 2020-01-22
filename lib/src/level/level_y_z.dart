import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RoomYZ {}

class LevelYZ extends StatefulWidget {
  final RoomYZ room;
  double x = 0.0;
  double y = 0.0;

  LevelYZ({
    @required this.room, this.x, this.y
  }) : assert(room != null);

  @override
  _LevelYZState createState() => _LevelYZState();
}

class _LevelYZState extends State<LevelYZ> {
  double x = 0.0;
  double y = 0.0;

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
            y = (y+p.delta.dy) >ymax - markerHight ? ymax -markerHight : y+p.delta.dy;

          });
        },
        child: Card(
          child: Stack(
            children: <Widget>[

              Marker(
                x: 0,
                y: 0,
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
  final double y;

  Marker({this.x: 500.0, this.y: 500.0,});

  @override
  Widget build(BuildContext context) {
    print("x: $x, y: $y");
    return Transform(
      transform: Matrix4.translationValues(x, y, 0.0), 
      child: CircleAvatar());
  }
}