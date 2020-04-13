import 'package:flutter/material.dart';
import 'dart:convert';
import 'LayoutDrawer.dart';

class SpacersAndExpandeds extends StatelessWidget {
  final List<dynamic> peopleList;
  SpacersAndExpandeds({this.peopleList});

  @override
  Widget build(BuildContext context) {
    return Column(
      // Uncomment each of these lines to see the effect.
      // "start" is the default
      // mainAxisAlignment: MainAxisAlignment.end,
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        // Wrap this Row with an Expanded widget. You'll
        // see a space around it, taking up all the extra
        // space on the page. 
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
        // Uncomment the Spacer widget here and it will 
        // take up all the extra space. If you put more 
        // Spacers, each will apportion the available space
        // between them.
        // Spacer(),
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

class SpacersAndExpandedsDemo extends StatefulWidget {
  @override
  _SpacersAndExpandedsDemoState createState() =>
      _SpacersAndExpandedsDemoState();
}

class _SpacersAndExpandedsDemoState extends State<SpacersAndExpandedsDemo> {
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
      body: SpacersAndExpandeds(peopleList: _peopleList),
    );
  }
}
