import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_plot/flutter_plot.dart';

import 'package:lab_5/logic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Pure(),
            Euler(),
            Taylor(),
            Adams(),
          ],
        ),
      ),
    );
  }
}

class Pure extends StatelessWidget {
  const Pure({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Точное решение'),
        Wrap(
          children: [
            Graphic(title: 'N=10', data: pure(10)),
            Graphic(title: 'N=20', data: pure(20)),
            Graphic(title: 'N=30', data: pure(30)),
          ],
        ),
      ],
    );
  }
}

class Adams extends StatelessWidget {
  const Adams({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Метод Адамса 2 порядка'),
        Wrap(
          children: [
            Graphic(title: 'N=10', data: adams(10)),
            Graphic(title: 'N=20', data: adams(20)),
            Graphic(title: 'N=30', data: adams(30)),
          ],
        ),
      ],
    );
  }
}

class Taylor extends StatelessWidget {
  const Taylor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Метод Тейлора 2 порядка'),
        Wrap(
          children: [
            Graphic(title: 'N=10', data: taylor(10)),
            Graphic(title: 'N=20', data: taylor(20)),
            Graphic(title: 'N=30', data: taylor(30)),
          ],
        ),
      ],
    );
  }
}

class Euler extends StatelessWidget {
  const Euler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Явный метод Эйлера'),
        Wrap(
          children: [
            Graphic(title: 'N=10', data: euler(10)),
            Graphic(title: 'N=20', data: euler(20)),
            Graphic(title: 'N=30', data: euler(30)),
          ],
        ),
      ],
    );
  }
}

class Graphic extends StatelessWidget {
  final String title;
  final List<Point> data;

  const Graphic({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Plot(
        xTitle: title,
        height: 300,
        centered: true,
        data: data,
        style: PlotStyle(
          axisStrokeWidth: 1.0,
          primary: Colors.transparent,
          trace: true,
          traceStokeWidth: 2.0,
          traceColor: Colors.blueGrey,
          traceClose: true,
          textStyle: new TextStyle(
            fontSize: 8.0,
            color: Colors.grey,
          ),
          axis: Colors.blueGrey[600],
          gridline: Colors.blueGrey[100],
        ),
        gridSize: Offset(1, 1),
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
