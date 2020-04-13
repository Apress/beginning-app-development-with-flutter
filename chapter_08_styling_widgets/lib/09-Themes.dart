import 'package:flutter/material.dart';

class Themes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child: ListView(
          children: <Widget>[
            Text('body1', style: Theme.of(context).textTheme.body1),
            Text('body2', style: Theme.of(context).textTheme.body2),
            Text('button', style: Theme.of(context).textTheme.button),
            Text('caption', style: Theme.of(context).textTheme.caption),
            Text('display1', style: Theme.of(context).textTheme.display1),
            Text('display2', style: Theme.of(context).textTheme.display2),
            Text('display3', style: Theme.of(context).textTheme.display3),
            Text('display4', style: Theme.of(context).textTheme.display4),
            Text('headline', style: Theme.of(context).textTheme.headline),
            Text('overline', style: Theme.of(context).textTheme.overline),
            Text('subhead', style: Theme.of(context).textTheme.subhead),
            Text('subtitle', style: Theme.of(context).textTheme.subtitle),
            Text('title', style: Theme.of(context).textTheme.title),
          ],
        ),
      ),
    );
  }
}
