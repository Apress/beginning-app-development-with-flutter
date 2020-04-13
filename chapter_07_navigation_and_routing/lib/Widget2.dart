import 'package:flutter/material.dart';

class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "I'm widget 2",
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}
