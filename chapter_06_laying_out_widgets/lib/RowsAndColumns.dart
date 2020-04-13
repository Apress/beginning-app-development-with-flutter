import 'package:flutter/material.dart';
import 'dart:convert';
import 'LayoutDrawer.dart';

class RowsAndColumns extends StatelessWidget {
  final List<dynamic> peopleList;
  RowsAndColumns({this.peopleList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network(peopleList[0]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[0]["name"]["first"]} ${peopleList[0]["name"]["first"]}'),
                Text(peopleList[0]["location"]["street"]),
                Text(
                    '${peopleList[0]["location"]["city"]} ${peopleList[0]["location"]["state"]},  ${peopleList[0]["location"]["postcode"]}'),
                Text('Email: ${peopleList[0]["email"]}'),
                Text('Phone: ${peopleList[0]["cell"]}'),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Image.network(peopleList[1]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[1]["name"]["first"]} ${peopleList[1]["name"]["first"]}'),
                Text(peopleList[1]["location"]["street"]),
                Text(
                    '${peopleList[1]["location"]["city"]} ${peopleList[1]["location"]["state"]},  ${peopleList[1]["location"]["postcode"]}'),
                Text('Email: ${peopleList[1]["email"]}'),
                Text('Phone: ${peopleList[1]["cell"]}'),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Image.network(peopleList[2]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[2]["name"]["first"]} ${peopleList[2]["name"]["last"]}'),
                Text(peopleList[2]["location"]["street"]),
                Text(
                    '${peopleList[2]["location"]["city"]} ${peopleList[2]["location"]["state"]},  ${peopleList[2]["location"]["postcode"]}'),
                Text('Email: ${peopleList[2]["email"]}'),
                Text('Phone: ${peopleList[2]["cell"]}'),
              ],
            ),
          ],
        ),
                Row(
          children: <Widget>[
            Image.network(peopleList[3]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[3]["name"]["first"]} ${peopleList[3]["name"]["last"]}'),
                Text(peopleList[3]["location"]["street"]),
                Text(
                    '${peopleList[3]["location"]["city"]} ${peopleList[3]["location"]["state"]},  ${peopleList[3]["location"]["postcode"]}'),
                Text('Email: ${peopleList[3]["email"]}'),
                Text('Phone: ${peopleList[3]["cell"]}'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class RowsAndColumnsDemo extends StatefulWidget {
  @override
  _RowsAndColumnsDemoState createState() => _RowsAndColumnsDemoState();
}

class _RowsAndColumnsDemoState extends State<RowsAndColumnsDemo> {
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
      body: RowsAndColumns(peopleList: _peopleList),
    );
  }
}
