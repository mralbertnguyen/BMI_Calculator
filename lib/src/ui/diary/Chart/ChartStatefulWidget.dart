import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChartStatefullWidget();
  }
}

class ChartStatefullWidget extends StatefulWidget {
  ChartStatefullWidget({Key key}) : super(key: key);

  @override
  ChartState createState() => new ChartState();
}

class ChartState extends State<ChartStatefullWidget> {
  double widthScreen = 0.0;
  double heightScreen = 0.0;

  // X value -> Y value
  static const data = [
    75.0,
    78.0,
    79.0,
    80.0,
    75.0,
    78.0,
    70.0,
    76.0,
    79.0,
    81.0,
    79.0,
    76.0,
    79.0,
  ];

  @override
  Widget build(BuildContext context) {
    // // Get width height
    widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Stack(
      children: <Widget>[
        // Chart
        _chart(),
        // center view
        _centerView()
      ],
    );
  }

  /// Center view - selected view
  Widget _centerView() {
    final Color colorBegin = Color.fromARGB(25, 250, 250, 250);
    final Color colorEnd = Color.fromARGB(0, 50, 65, 72);

    return Center(
      child: Container(
          width: widthScreen * 0.2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [colorBegin, colorEnd]),
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }

  /// Chart main
  Widget _chart() {
    final Color colorBegin = Color.fromARGB(100, 1, 87, 155);
    final Color colorEnd = Color.fromARGB(100, 129, 212, 500);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 5/2,
          // decoration: BoxDecoration(color: Colors.red),
          child: Sparkline(
              data: data,
              lineWidth: 5.0,
              lineGradient: new LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [colorBegin, colorEnd],
              )),
        )
      ],
    );
  }
}
