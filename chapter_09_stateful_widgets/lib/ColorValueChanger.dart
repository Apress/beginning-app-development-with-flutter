import 'package:flutter/material.dart';

class ColorValueChanger extends StatefulWidget {
  final String property;
  final Function onChanged;
  final int value;
  // Value passed in from its host
  ColorValueChanger(
      {Key key,
      this.property = "property",
      this.value = 0,
      this.onChanged})
      : super(key: key);

  _ColorValueChangerState createState() => new _ColorValueChangerState();
}

class _ColorValueChangerState extends State<ColorValueChanger> {
  int _value;
  @override
  Widget build(BuildContext context) {
    _value = widget.value;
    return Container(
      child: Column(
        children: <Widget>[
          Text(widget.property, style: Theme.of(context).textTheme.subtitle),
          Slider(
            min: 0,
            max: 255,
            value: _value?.toDouble(),
            label: widget.property,
            onChanged: _onChanged,
          )
        ],
      ),
    );
  }

  _onChanged(double value) {
    setState(() {
      this._value = value.round();
    });
    widget.onChanged(widget.property, value.round());
  }
}
