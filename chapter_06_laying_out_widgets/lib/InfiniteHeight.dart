import 'package:flutter/material.dart';
import 'LayoutDrawer.dart';

class InfiniteHeightDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("One"),
        Text("Two"),
        // If you uncomment, the next line you get the dreaded "unbounded height" error.
        //ListView(children: <Widget>[Text("2.25"),Text("2.5"),Text("2.75")],),
        // To fix it, you can wrap the ListView in an Expanded.
        Text("Three"),
        Text("Four"),
      ],
    );
  }
}

class InfiniteHeightScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: InfiniteHeightDemo(),
    );
  }
}
