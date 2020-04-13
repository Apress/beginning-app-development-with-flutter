import 'package:flutter/material.dart';
import 'NavigationDrawer.dart';
import 'PeopleList.dart';
import 'PeopleUpsert.dart';
import 'PexelsPhotos.dart';
import 'SimpleGet.dart';

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
      title: 'Chapter 11 Ajax',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext ctx) => Landing(),
        '/simpleGet': (BuildContext ctx) => SimpleGet(),
        '/pexelsPhotos': (BuildContext ctx) => PexelsPhotos(),
        '/peopleAdd': (BuildContext ctx) => PeopleUpsert(),
        '/peopleList': (BuildContext ctx) => PeopleList(),
        '/peopleUpsert': (BuildContext ctx) => PeopleUpsert(),
      },
    );
  }
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ch 11 Ajax'),
      ),
      body: Container(
        color: Colors.limeAccent,
      ),
      drawer: NavigationDrawer(),
    );
  }
}
