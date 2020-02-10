import 'dart:async';

import 'package:flutter/material.dart';
import '../planesPage/planes/XYPlane.dart';
import '../planesPage/planes/XZPlane.dart';
import '../planesPage/planes/ZYPlane.dart';
// import '../../data/data.dart' as ble;

// import 'dart:async';
import 'dart:convert' show utf8;

// import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
// import 'package:oscilloscope/oscilloscope.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({Key key, this.device}) : super(key: key);
  final BluetoothDevice device;

  @override
  _SensorPageState createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  final String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  final String CHARACTERISTIC_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
  bool isReady;
  Stream<List<int>> stream;
  List<double> traceDust = List();

  @override
  void initState() {
    super.initState();
    isReady = false;
    connectToDevice();
  }

  connectToDevice() async {
    if (widget.device == null) {
      _Pop();
      return;
    }

    new Timer(const Duration(seconds: 15), () {
      if (!isReady) {
        disconnectFromDevice();
        _Pop();
      }
    });

    await widget.device.connect();
    discoverServices();
  }

  disconnectFromDevice() {
    if (widget.device == null) {
      _Pop();
      return;
    }

    widget.device.disconnect();
  }

  discoverServices() async {
    if (widget.device == null) {
      _Pop();
      return;
    }

    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == SERVICE_UUID) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            stream = characteristic.value;

            setState(() {
              isReady = true;
            });
          }
        });
      }
    });

    if (!isReady) {
      _Pop();
    }
  }

  Future<bool> _onWillPop() {
    return showDialog(
        context: context,
        builder: (context) =>
            new AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to disconnect device and go back?'),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('No')),
                new FlatButton(
                  onPressed: () {
                    disconnectFromDevice();
                    Navigator.of(context).pop(true);
                  },
                  child: new Text('Yes'),
                ),
              ],
            ) ??
            false);
  }

  _Pop() {
    Navigator.of(context).pop(true);
  }

  String _dataParser(List<int> dataFromDevice) {
    return utf8.decode(dataFromDevice);
  }

  @override
  Widget build(BuildContext context) {
    // Oscilloscope oscilloscope = Oscilloscope(
    //   showYAxis: true,
    //   padding: 0.0,
    //   backgroundColor: Colors.black,
    //   traceColor: Colors.white,
    //   yAxisMax: 3000.0,
    //   yAxisMin: 0.0,
    //   dataSet: traceDust,
    // );

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Optical Dust Sensor'),
        ),
        body: Container(
          child: !isReady
              ? Center(
                  child: Text(
                    "Waiting...",
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  ),
                )
              : Container(
                  child: StreamBuilder<List<int>>(
                    stream: stream,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<int>> snapshot) {
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');

                      if (snapshot.connectionState == ConnectionState.active) {
                        // double currentValue = 0.0;
                        var currentValue = double.parse(_dataParser(snapshot.data));
                        // traceDust.add(double.tryParse(currentValue) ?? 0);

                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    // Text('Current value from Sensor',
                                    //     style: TextStyle(fontSize: 14)),
                                    // Text(
                                    //   '${currentValue} ug/m3',
                                    //   style: TextStyle(
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 24),
                                    // ),
                                    PlanesPagePhone(x: currentValue),
                                  ],
                                ),
                              ),
                              // Expanded(
                              //   flex: 1,
                              //   child: oscilloscope,
                              // )
                            ],
                          ),
                        );
                      } else {
                        return Text('Check the stream');
                      }
                    },
                  ),
                ),
        ),
      ),
    );
  }
}

class PlanesPagePhone extends StatefulWidget {
  double x = 0;
  double y = 0;
  double z = 0;
  double g = 0;
  int hz = 0;
  int hzMax = 0;
  int hzMin = 0;

  PlanesPagePhone({this.x});

  @override
  _PlanesPagePhoneState createState() => _PlanesPagePhoneState();
}

class _PlanesPagePhoneState extends State<PlanesPagePhone> {
  Stopwatch watch = Stopwatch();
  Timer timer;

  double x = 0;
  double y = 0;
  double z = 0;
  double g = 0;
  int hz = 0;
  int hzMax = 0;
  int hzMin = 0;
  
  // double y = ble.randomData()[1];
  // double z = ble.randomData()[2];
  // double g = ble.randomData()[3];
  // int hz = ble.randomData()[4];
  // int hzMax = ble.randomData()[5];
  // int hzMin = ble.randomData()[6];

  getData(Timer timer) {
    setState(() {
      x = widget.x;
      y = widget.y;
      z = widget.z;
      g = widget.g;
      hz = widget.hz;
      hzMax = widget.hzMax;
      hzMin = widget.hzMin;
      print('x: $x, y: $y, z: $z');
    });
  }

  startWatch() {
    watch.start();
    timer = Timer.periodic(Duration(milliseconds: 1000), getData);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(
                Icons.play_arrow,
                color: Colors.black,
              ),
              onPressed: startWatch,
            ),
          ],
          centerTitle: true,
          title: Text(
            'SISMIC',
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(color: Colors.grey),
            tabs: <Widget>[
              Tab(
                text: "X : Y",
              ),
              Tab(
                text: "X : Z",
              ),
              Tab(
                text: "Z : Y",
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          XYPlane(
            room: RoomXY(),
            x: this.x,
            y: this.y,
            g: this.g,
            hz: this.hz,
            hzMax: this.hzMax,
            hzMin: this.hzMin,
          ),
          XZPlane(
            room: RoomXZ(),
            x: this.x,
            z: this.z,
            g: this.g,
            hz: this.hz,
            hzMax: this.hzMax,
            hzMin: this.hzMin,
          ),
          ZYPlane(
            room: RoomZY(),
            z: this.z,
            y: this.y,
            g: this.g,
            hz: this.hz,
            hzMax: this.hzMax,
            hzMin: this.hzMin,
          ),
        ]),
      ),
    );
  }
}
