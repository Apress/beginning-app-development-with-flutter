import 'package:flutter/material.dart';
import 'MainView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = "Color Mixer";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MainView(title: title),
    );
  }
}

