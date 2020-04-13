import 'package:flutter/material.dart';
import 'ColorCircle.dart';

class FavoriteColors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Text("Your favorite colors",
          style: Theme.of(context).textTheme.headline
              ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonTheme(
            child: ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  ColorCircle(color: Colors.red),
                  ColorCircle(color: Colors.teal),
                  ColorCircle(color: Colors.deepPurple),
                  ColorCircle(color: Color(0xffFF7F00)),
                ]),
          ),
        ),
      ]),
    );
  }
}
