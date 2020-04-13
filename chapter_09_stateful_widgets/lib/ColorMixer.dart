import 'package:flutter/material.dart';
import 'ColorCircle.dart';
import 'ColorValueChanger.dart';
// The stateful widget
class ColorMixer extends StatefulWidget {
  ColorMixer({Key key}) : super(key: key);
  _ColorMixerState createState() => _ColorMixerState();
}
// The state object
class _ColorMixerState extends State<ColorMixer> {
  // These three variables are the 'state' of the widget
  int _redColor = 0;
  int _blueColor = 0;
  int _greenColor = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // This widget uses the variables (aka state)
          ColorCircle(color: Color.fromRGBO(_redColor, _greenColor, _blueColor, 1), radius: 200,),
          // These three pass the _setColor function down so that the state
          // *here* can be changed at lower levels. This is called "lifting
          // state up".
          ColorValueChanger(property: "Red", value:_redColor, onChanged: _setColor),
          ColorValueChanger(property: "Green", value:_greenColor, onChanged: _setColor),
          ColorValueChanger(property: "Blue", value:_blueColor, onChanged: _setColor),
        ],
      ),
    );
  }
  void _setColor(String property, int value) {
    setState(() {
      _redColor = (property == "Red") ? value : _redColor;
      _greenColor = (property == "Green") ? value : _greenColor;
      _blueColor = (property == "Blue") ? value : _blueColor;
    });
  }
}