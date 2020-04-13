import 'package:flutter/material.dart';
import 'PeopleList.dart';
import 'PeopleUpsert.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter 12 Firebase',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext ctx) => Landing(),
        '/peopleUpsert': (BuildContext ctx) => PeopleUpsert(),
        '/peopleList': (BuildContext ctx) => PeopleList(),
      },
      initialRoute: '/peopleList',
    );
  }
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ch 11 Ajax and Firebase'),
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
