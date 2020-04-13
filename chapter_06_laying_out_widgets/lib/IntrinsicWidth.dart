import 'package:flutter/material.dart';

class IntrinsicWidthSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.yellowAccent,
                border: Border.all(color: Colors.black)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  child: Text("A"),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text("B"),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text("This is a super-long button"),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text("D"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                border: Border.all(color: Colors.black)),
            child: IntrinsicWidth(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    child: Text("A"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("B"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("This is a long button"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("D"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                border: Border.all(color: Colors.black)),
            child: IntrinsicWidth(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    child: Text("A"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("B"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("This is a super-long button"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("D"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
