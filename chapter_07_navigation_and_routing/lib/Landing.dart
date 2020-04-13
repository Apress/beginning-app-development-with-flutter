import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ch 7 Navigation'),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1,
          children: makeWidgets(context)),
    );
  }

  List<Widget> makeWidgets(BuildContext context) {
    final List<Map<String, dynamic>> listOfThings = <Map<String, dynamic>>[
      <String, dynamic>{
        'label': 'Drawer Navigation',
        'description':
            'A drawer peeks in from the left side (configurable) and when the user swipes right or taps it, the drawer opens, revealing menu choices.',
        'route': '/drawer',
        'background': Colors.amberAccent,
      },
      <String, dynamic>{
        'label': 'Stack Navigation',
        'description':
            'Replacing the entire scene with another widget. Keeps track of history, allowing you to go back and forward.',
        'route': '/stack',
        'background': Colors.blueAccent,
      },
      <String, dynamic>{
        'label': 'Tab',
        'description':
            "A stationary set of tabs at the top or bottom of the widget that doesn't change but as a tab is pressed, the content changes.",
        'route': '/tab',
        'background': Colors.purpleAccent,
      },
      <String, dynamic>{
        'label': 'Dialog',
        'description':
            "Not technically navigation, but we're showing a widget and then closing it. This could be considered a form of navigation.",
        'route': '/dialog',
        'background': Colors.redAccent,
      },
    ];
    return listOfThings
        .map((Map<String, dynamic> thing) => Container(
            decoration: BoxDecoration(
              color: thing['background'],
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(offset: const Offset(5.0, 5.0), blurRadius: 7.0)
              ],
            ),
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, thing['route']);
              },
              child: Column(children: <Widget>[
                Text(
                  thing['label'],
                  style: Theme.of(context).textTheme.headline,
                ),
                Divider(
                  color: Colors.black,
                ),
                Text(thing['description']),
              ]),
            )))
        .toList();
  }
}