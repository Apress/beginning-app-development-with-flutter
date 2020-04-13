import 'package:flutter/material.dart';
import 'Dialogs.dart';
import 'DrawerNavigation.dart';
import 'Landing.dart';
import 'StackNavigation.dart';
import 'TabNavigation.dart';
import 'WidgetWithDrawer1.dart';
import 'WidgetWithDrawer2.dart';
import 'WidgetWithDrawer3.dart';
import 'WidgetWithScaffold1.dart';
import 'WidgetWithScaffold2.dart';
import 'WidgetWithScaffold3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation and Routing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext ctx) => Landing(),
        '/tab': (BuildContext ctx) => TabNavigation(),
        '/drawer': (BuildContext ctx) => DrawerNavigation(),
        '/stack': (BuildContext ctx) => StackNavigation(),
        '/dialog': (BuildContext ctx) => Dialogs(),
        '/drawer1': (BuildContext ctx) => WidgetWithDrawer1(),
        '/drawer2': (BuildContext ctx) => WidgetWithDrawer2(),
        '/drawer3': (BuildContext ctx) => WidgetWithDrawer3(),
        '/stack1': (BuildContext ctx) => WidgetWithScaffold1(),
        '/stack2': (BuildContext ctx) => WidgetWithScaffold2(),
        '/stack3': (BuildContext ctx) => WidgetWithScaffold3(),
      },
    );
  }
}