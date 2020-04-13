import 'package:flutter/material.dart';

class StackNavigation extends StatelessWidget {
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
                'Stack Navigation',
                style: Theme.of(context).textTheme.display1,
              ),
              RaisedButton(
                child: const Text('Scene 1'),
                onPressed: () => Navigator.pushNamed(context, '/stack1'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
