import 'package:flutter/material.dart';

class Widget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "I'm widget 3",
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}
