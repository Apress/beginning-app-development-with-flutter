import 'package:flutter/material.dart';
import 'BoxModel.dart';
import 'Container.dart';
import 'FittedBox.dart';
import 'FlexAndFlexible.dart';
import 'GridViewCount.dart';
import 'GridViewExtent.dart';
import 'InfiniteHeight.dart';
import 'IntrinsicWidth.dart';
import 'LandingScene.dart';
import 'ListView.dart';
import 'ListViewWithListTile.dart';
import 'MainAxisAlignment.dart';
import 'RowsAndColumns.dart';
import 'SnackBar.dart';
import 'SpacersAndExpandeds.dart';
import 'Tables.dart';
//import 'package:flutter/rendering.dart';

void main() {
//debugPaintSizeEnabled=true;
runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ch 5 Layouts",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext ctx) => LandingSceneDemo(),
        '/boxModel': (BuildContext ctx) => BoxModelDemo(),
        '/container': (BuildContext ctx) => ContainerDemo(),
        '/fittedBox': (BuildContext ctx) => FittedBoxDemo(),
        '/flexAndFlexible': (BuildContext ctx) => FlexAndFlexibleDemo(),
        '/gridViewExtent': (BuildContext ctx) => GridViewExtentDemo(),
        '/gridViewCount': (BuildContext ctx) => GridViewCountDemo(),
        '/infiniteHeight': (BuildContext ctx) => InfiniteHeightDemo(),
        '/intrinsicWidth': (BuildContext ctx) => IntrinsicWidthSetting(),
        '/rowsAndColumns': (BuildContext ctx) => RowsAndColumnsDemo(),
        '/mainAxisAlignment': (BuildContext ctx) => MainAxisAlignmentDemo(),
        '/snackBar': (BuildContext ctx) => SnackBarDemo(),
        '/spacersAndExpandeds': (BuildContext ctx) => SpacersAndExpandedsDemo(),
        '/listView': (BuildContext ctx) => ListViewDemo(),
        '/listViewWithListTile': (BuildContext ctx) => ListViewWithListTileDemo(),
        '/tables': (BuildContext ctx) => TablesDemo(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
