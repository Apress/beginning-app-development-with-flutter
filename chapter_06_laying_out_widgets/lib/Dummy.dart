import 'package:flutter/material.dart';
import 'dart:math';

class Dummy extends StatelessWidget {
  final List<Color> _colors = <Color>[
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.yellow,
    Colors.pink,
    Colors.lime,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    Color random = _colors[new Random().nextInt(_colors.length)];

    return Container(
        height: 100,
        child: Placeholder(
          color: random,
        ));
  }
}