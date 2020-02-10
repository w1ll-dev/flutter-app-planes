// import 'dart:async';
// import 'dart:math';

// Stopwatch watch = Stopwatch();
// Timer timer;

// double x = 0.0;
// double y = 0.0;
// double z = 0.0;
// double g = 2.4;
// int hz = 21;
// int hzMax = 21;
// int hzMin = 21;
// List data = [x, y, z, g, hz, hzMax, hzMin,];

// randomData(){
//   setHzMax(value){
//     if(value > hzMax){
//         hzMax = value;
//     }
//   }

//   setHzMin(value){
//     if(value < hzMin){
//         hzMin = value;
//     }
//   }
  

//   randomPositions(Timer timer) {
//     var rng = Random();
//       x = rng.nextInt(20).toDouble();
//       y = rng.nextInt(20).toDouble();
//       z = rng.nextInt(20).toDouble();
//       g = double.parse((rng.nextDouble() + 2).toStringAsPrecision(2));
//       hz = (rng.nextInt(4) + 20);
//       setHzMax(hz);
//       setHzMin(hz);
//     if(data.length < 7){
//       data.add(x);
//       data.add(y);
//       data.add(z);
//       data.add(g);
//       data.add(hz);
//       data.add(hzMax);
//       data.add(hzMin);
//     }else{
//       data = [];
//     }
//     print(data);
//     return data;
//   }

//   startWatch() {
//     watch.start();
//     timer = Timer.periodic(Duration(milliseconds: 100), randomPositions);
//   }

//   startWatch();

//   return data;
// }

// void main(){
//   randomData();
// }

