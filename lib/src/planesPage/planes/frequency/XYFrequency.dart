import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './graphic/XYGraphic.dart';

class XYFrequency extends StatelessWidget {
  int hz;
  int hzMax;
  int hzMin;

  XYFrequency({
    this.hz,
    this.hzMax,
    this.hzMin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 20.0,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "${this.hzMax}",
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
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment(0, 0),
          children: <Widget>[
            XYGraphic(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${this.hz}",
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
        Container(
          margin: const EdgeInsets.only(right: 20.0,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${this.hzMin}",
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
      ],
    );
  }
}