import 'package:flutter/material.dart';
import 'dart:convert';
import 'LayoutDrawer.dart';

/*
A playground for the Table widgets.
*/

class TablesDemo extends StatefulWidget {
  @override
  _TablesDemoState createState() => _TablesDemoState();
}

class _TablesDemoState extends State<TablesDemo> {
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
    const TextStyle bold = TextStyle(fontWeight: FontWeight.bold);
return Table(
  children: <TableRow>[
        TableRow(children: <Widget>[
          Text('Salesperson', style: bold,),
          Text('January', style: bold,),
          Text('February', style: bold,),
          Text('March', style: bold,),
        ]
        ),
        TableRow(children: <Widget>[
          Text('Dwight'),
          Text('3742'),
          Text('5573'),
          Text('4323'),
        ],),
        TableRow(children: <Widget>[
          Text('Phyllis'),
          Text('3823'),
          Text('4500'),
          Text('3277'),
        ],
        ),
      ],
    );
  }

  Widget deleteMe() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _peopleList.length,
      itemBuilder: (BuildContext context, int i) {
        String fullName =
            "${propercase(_peopleList[i]['name']['first'])} ${propercase(_peopleList[i]['name']['last'])}";
        String cell = _peopleList[i]['cell'];
        String email = _peopleList[i]['email'];
        return Container(
          padding: EdgeInsets.all(5.0), // Putting a padding around each 'card'
          child:  Row(
            children: <Widget>[
              Container(
                // width: 0,
                // height: 100,
                // color: Colors.orange,
                // alignment: Alignment.centerRight,
                // padding: EdgeInsets.all(20),
                // margin: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 10.0), // Add space to the right of the image
                child: Image.network(_peopleList[i]['picture']['thumbnail']),
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
      },
    );
  }
}
