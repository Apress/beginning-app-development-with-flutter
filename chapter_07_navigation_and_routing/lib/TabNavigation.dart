import 'package:flutter/material.dart';
import 'Widget1.dart';
import 'Widget2.dart';
import 'Widget3.dart';

class TabNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Navigation'),
          bottom: TabBar(tabs: const <Widget>[
            Tab(icon: Icon(Icons.looks_one), child: Text('Show 1')),
            Tab(icon: Icon(Icons.looks_two), child: Text('Show 2')),
            Tab(icon: Icon(Icons.looks_3), child: Text('Show 3')),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            Widget1(),
            Widget2(),
            Widget3(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Theme.of(context).colorScheme.primary,
          child: TabBar(tabs: const <Widget>[
            Tab(icon: Icon(Icons.looks_one), child: Text('Show A')),
            Tab(icon: Icon(Icons.looks_two), child: Text('Show B')),
            Tab(icon: Icon(Icons.looks_3), child: Text('Show C')),
          ]),
        ),
      ),
    );
  }
}
