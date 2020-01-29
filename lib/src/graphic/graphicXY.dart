import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphicXY extends StatefulWidget {
  Timer timer;
  GraphicXY({this.timer});

  @override
  _GraphicXYState createState() => _GraphicXYState();
}

class _GraphicXYState extends State<GraphicXY> {

  

  @override
  Widget build(BuildContext context) {

    widget.timer = Timer(Duration(milliseconds: 1000), () {
      setState(() {
        getDynamicData();
      });
    });

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 100,
            child: SfCartesianChart(
              trackballBehavior: TrackballBehavior(
                enable: false,
                activationMode: ActivationMode.singleTap
              ),
              primaryXAxis: NumericAxis( 
                isVisible: false,
              ), 

              primaryYAxis: NumericAxis( 
                //Hide the gridlines of y-axis 
                majorGridLines: MajorGridLines(width: 0), 
                //Hide the axis line of y-axis 
                axisLine: AxisLine(width: 0),
                interval: 5, 
              ),

              legend: Legend(
                isVisible: false
              ),

              tooltipBehavior: TooltipBehavior(
                // borderColor: Colors.transparent,
                enable: false,
                activationMode: ActivationMode.longPress
              ),

              zoomPanBehavior: ZoomPanBehavior(
                enableDoubleTapZooming: false,
                enablePanning: false,
                zoomMode: ZoomMode.x
              ),

              series: <ChartSeries>[
                
                LineSeries<SalesData,double>(
                  color: Colors.grey[300],
                  dataSource: getDynamicData(),
                  
                  xValueMapper: (SalesData sales,_) => sales.x,
                  yValueMapper: (SalesData sales,_) => sales.y,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class SalesData{
  double x,y;
  SalesData(this.x, this.y);
}

List<SalesData> dynamicData = <SalesData>[];
int j = 0;

dynamic getDynamicData() {
  j++;
  double value = 0;
  Random rand = Random();
  double k = (rand.nextInt(500).toDouble());

  if (k > 250) {
    value += rand.nextDouble();
  } else {
    value -= rand.nextDouble();
  }

  dynamicData.add(SalesData(j.toDouble(), value));

  return dynamicData;
}


