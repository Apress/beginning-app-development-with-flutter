import 'package:chapter_10_talking_to_other_computers/ReadAFile.dart';
import 'package:flutter/material.dart';
import 'ChangeUserPreferences.dart';
import 'JsonReadingAndWriting.dart';
import 'LandingScene.dart';
import 'ReadAssetsFile.dart';
import 'WriteNewFile.dart';

void main() {
//debugPaintSizeEnabled=true;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ch 10 Your Flutter app can work with files',
      theme: ThemeData(primarySwatch: Colors.red),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext ctx) => LandingScene(),
        '/changingUserPreferences': (BuildContext ctx) => ChangeUserPreferences(),
        '/jsonReadingAndWriting': (BuildContext ctx) => JsonReadingAndWriting(),
        '/readAssetsFile': (BuildContext ctx) => ReadAssetsFile(),
        '/readAFile': (BuildContext ctx) => ReadAFile(),
        '/writeNewFile': (BuildContext ctx) => WriteNewFile(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
