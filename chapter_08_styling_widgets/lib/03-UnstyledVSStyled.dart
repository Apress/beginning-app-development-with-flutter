import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hello world",
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.lineThrough,
            fontFamily: "Courier",
            fontSize: 34.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
