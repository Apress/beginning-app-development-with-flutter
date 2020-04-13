import 'package:flutter/material.dart';
import 'ColorMixer.dart';
import 'FavoriteColors.dart';

class MainView extends StatelessWidget {
  final String title;
  MainView({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorMixer(),
            FavoriteColors(),
          ],
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.check),
      ),
    );
  }
}

