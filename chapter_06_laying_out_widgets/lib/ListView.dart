import 'package:flutter/material.dart';
import 'dart:convert';
import 'LayoutDrawer.dart';

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
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
      body: _showPeople(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  String propercase(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  Widget _showPeople() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _peopleList.length,
      itemBuilder: (BuildContext context, int i) {
        return PersonCard(_peopleList[i]);
      },
    );
  }
}

class PersonCard extends StatelessWidget {
  final dynamic person;
  PersonCard(this.person);
  @override
  Widget build(BuildContext context) {
    String fullName =
        "${propercase(person['name']['first'])} ${propercase(person['name']['last'])}";
    String cell = person['cell'];
    String email = person['email'];
    return Container(
      //decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.all(Radius.circular(5.0))),
      margin: const EdgeInsets.only(top: 4.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(person['picture']['thumbnail']),
          ),
          Column(
            children: <Widget>[
              Text(fullName),
              Text('Email: $email'),
              Text('Cell: $cell')
            ],
          ),
        ],
      ),
    );
  }

  String propercase(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }
}
