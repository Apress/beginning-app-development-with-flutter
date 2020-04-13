import 'package:flutter/material.dart';
import 'IconsDemo.dart';
import 'ImagesDemo.dart';
import 'ProperForm.dart';
import 'SimplestForm.dart';
import 'TextDemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ch 4 Value Widgets',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomeScene(),
    );
  }
}

class HomeScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ch 4 - Value Widgets'),
        ),
        body: TabBarView(
          children: <Widget>[
            TextDemo(),
            IconsDemo(),
            ImagesDemo(),
            SimplestForm(),
            ProperForm(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Theme.of(context).colorScheme.primary,
          child: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text('Text'),
              ),
              Tab(
                child:  Text('Icons'),
              ),
              Tab(
                child:  Text('Images'),
              ),
              Tab(
                child:  Text('Simple Form'),
              ),
              Tab(
                child:  Text('Proper Form'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


