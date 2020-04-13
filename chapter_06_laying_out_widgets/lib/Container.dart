import 'package:flutter/material.dart';
import 'dart:convert';
import 'LayoutDrawer.dart';

/* 
A playground for experimenting with a single container's
alignment, positioning, width, height, padding, margin, 
and border.
See BoxModel.dart for padding and margin in context with
other widgets.
*/

class ContainerSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(color: Colors.purple[300]),
      color: Colors.purple,
      alignment: Alignment.centerLeft,
      child: Container(
        color: Colors.orange[300],
        child: Text("foo", style:TextStyle(fontSize: 50)),
        //height: 100, 
        //width: 200,
        //alignment: Alignment.bottomLeft,
        //margin: EdgeInsets.only(top:20, bottom:20, left:30, right:100),
      ),
    );
  }
}

class ContainerDemo extends StatefulWidget {
  @override
  _ContainerDemoState createState() => _ContainerDemoState();
}

class _ContainerDemoState extends State<ContainerDemo> {
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
      body: ContainerSetting(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}