import 'package:flutter/material.dart';

class Dialogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialogs'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Dialogs',
                style: Theme.of(context).textTheme.display1,
              ),
              RaisedButton(
                child: const Text('No response'),
                onPressed: () => showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: const Text('Press OK to continue'),
                          actions: <Widget>[
                            FlatButton(
                                child: const Text('OK'),
                                onPressed: () => Navigator.pop(context)),
                          ],
                        );
                      },
                    ),
              ),
              RaisedButton(
                child: const Text('Get a response'),
                onPressed: () async {
                  final String response = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: const Text('Are you sure?'),
                        actions: <Widget>[
                          FlatButton(
                              child: const Text('Yes'),
                              onPressed: () => Navigator.pop(context, 'Yes')),
                          FlatButton(
                              child: const Text('No'),
                              onPressed: () => Navigator.pop(context, 'No')),
                        ],
                      );
                    },
                  );
                  print(response);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
