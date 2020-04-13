import 'package:flutter/material.dart';
import '03-UnstyledVSStyled.dart';
import '02-ColorsApplied.dart';
import '05-CustomFonts.dart';
import '06-Decorations.dart';
import '07-Stacks.dart';
import '09-Themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ch 8 - Styling Text',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (BuildContext ctx) => LandingScene(),
          '/contrast': (BuildContext ctx) => HelloWorld(),
          '/colors': (BuildContext ctx) => ColorsApplied(),
          '/fonts': (BuildContext ctx) => CustomFonts(),
          '/decorations': (BuildContext ctx) => Decorations(),
          '/cards': (BuildContext ctx) => Stacks(),
          '/themes': (BuildContext ctx) => Themes(),
        });
  }
}

class LandingScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chapter 8 - Styling')),
      body: Container(
        child: GridView.extent(
          maxCrossAxisExtent: 300,
          children: <Widget>[
            CustomButton(
                text: 'Contrast',
                iconData: Icons.compare,
                action: () => Navigator.pushNamed(context, '/contrast')),
            CustomButton(
                text: 'Colors',
                iconData: Icons.color_lens,
                action: () => Navigator.pushNamed(context, '/colors')),
            CustomButton(
                text: 'Fonts',
                iconData: Icons.font_download,
                action: () => Navigator.pushNamed(context, '/fonts')),
            CustomButton(
                text: 'Decorations',
                iconData: Icons.style,
                action: () => Navigator.pushNamed(context, '/decorations')),
            CustomButton(
                text: 'Stacks',
                iconData: Icons.picture_in_picture,
                action: () => Navigator.pushNamed(context, '/cards')),
            CustomButton(
                text: 'Theme',
                iconData: Icons.devices_other,
                action: () => Navigator.pushNamed(context, '/themes')),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function action;
  CustomButton({@required this.text, @required this.iconData, this.action});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: action,
        child: Column(
          children: <Widget>[
            Icon(
              iconData,
              color: Theme.of(context).primaryColorDark,
              size: 100.0,
            ),
            Text(text),
          ],
        ),
      ),
      decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).primaryColorDark, width: 5.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Theme.of(context).primaryColorLight),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
    );
  }
}
