import 'package:flutter/material.dart';
import 'dart:math';

class Decorations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child: Center(
          child: Container(
            child: Icon(
              Icons.exit_to_app,
              size: 200,
              color: Theme.of(context).iconTheme.color,
            ),
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              border: Border.all(
                width: 10,
                color: Theme.of(context).iconTheme.color,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset.fromDirection(0.25 * pi, 10.0),
                  blurRadius: 10.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
