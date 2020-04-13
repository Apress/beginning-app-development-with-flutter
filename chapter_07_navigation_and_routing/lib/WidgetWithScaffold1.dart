import 'package:flutter/material.dart';

class WidgetWithScaffold1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Navigation'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'I am widget 1',
                style: Theme.of(context).textTheme.display1,
              ),
              RaisedButton(
                child: const Text('Scene 2'),
                onPressed: () => Navigator.pushNamed(context, '/stack2'),
              ),
              RaisedButton(
                child: const Text('Go back'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
