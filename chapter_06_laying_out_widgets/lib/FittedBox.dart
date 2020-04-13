import 'package:flutter/material.dart';
import 'dart:convert';
import 'LayoutDrawer.dart';

class FittedBoxScaling extends StatelessWidget {
  final List<dynamic> peopleList;
  FittedBoxScaling({this.peopleList});

  @override
  Widget build(BuildContext context) {
    const String _imgSrc = 'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png';

    return Column(
      children: <Widget>[
        Container(height: 100, width: 400, decoration: BoxDecoration(color: Colors.red), child: Text('SizedBox'),),
        Image.network(_imgSrc, width: 400,),
      ],
    );
  }
}

class FittedBoxDemo extends StatefulWidget {
  @override
  _FittedBoxDemoState createState() => _FittedBoxDemoState();
}

class _FittedBoxDemoState extends State<FittedBoxDemo> {
  List<dynamic> _peopleList = List<dynamic>();

  void _getPeople() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: FittedBoxScaling(peopleList: _peopleList),
    );
  }
}
