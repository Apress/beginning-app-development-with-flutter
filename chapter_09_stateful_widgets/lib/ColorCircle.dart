import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  final Color color;
  final double radius;
  ColorCircle({@required this.color, this.radius=50});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: radius,
      height: radius,
      decoration: new BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}