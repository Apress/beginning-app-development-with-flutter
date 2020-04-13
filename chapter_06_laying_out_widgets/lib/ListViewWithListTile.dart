import 'package:flutter/material.dart';
import 'dart:convert';
import 'LayoutDrawer.dart';

class ListViewWithListTileDemo extends StatefulWidget {
  @override
  _ListViewWithListTileDemoState createState() => _ListViewWithListTileDemoState();
}

class _ListViewWithListTileDemoState extends State<ListViewWithListTileDemo> {
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
        String fullName =
            "${propercase(_peopleList[i]['name']['first'])} ${propercase(_peopleList[i]['name']['last'])}";
        String cell = _peopleList[i]['cell'];
        String email = _peopleList[i]['email'];
        return ListTile(
          subtitle: Column(
            children: <Widget>[Text('Email: $email'), Text('Cell: $cell')],
          ),
          leading: Image.network(_peopleList[i]['picture']['thumbnail']),
          // trailing:,
          title: Text(
            fullName,
          ),
        );
      },
    );
  }
}
