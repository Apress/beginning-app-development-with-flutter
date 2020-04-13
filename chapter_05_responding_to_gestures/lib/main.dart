import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './ManagePeople.dart';
import './AddPersonForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestures demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showHelp = false;
  List<Map<String,dynamic>> _people;
  _MyHomePageState() {
    _people = <Map<String, String>>[
      {"first": "Jim", "last": "Halpert"},
      {"first": "Kelly", "last": "Kapoor"},
      {"first": "Creed", "last": "Bratton"},
      {"first": "Dwight", "last": "Schrute"},
      {"first": "Andy", "last": "Bernard"},
      {"first": "Pam", "last": "Beasley"},
      {"first": "Jim", "last": "Halpert"},
      {"first": "Robert", "last": "California"},
      {"first": "David", "last": "Wallace"},
      {"first": "Erin", "last": ""},
      {"first": "Meredith", "last": "Palmer"},
      {"first": "Ryan", "last": "Howard"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    const String _title = "Gestures demo";
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Stack(children: <Widget>[
        ManagePeople(
            people: _people,
            deletePerson: _deletePerson,
            addPerson: _addPerson,
            updatePerson: _updatePerson),
        (_showHelp == true) ? _helpDialog() : Text(""),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.help),
        onPressed: () => setState(() => _showHelp = !_showHelp),
      ),
    );
  }

// Flutter study group - best pattern for getting context into a method.
  void _addPerson(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            content: AddPersonForm(
              addPerson: (Map<String, dynamic> newPerson) =>
                  setState(() => _people.add(newPerson)),
            ),
          ),
    );
  }

  void _deletePerson(Map<String, dynamic>person, BuildContext context) {
    setState(() => _people.remove(person));
    print("Deleted ${person['first']}");
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("Deleted ${person['first']}")));
  }

  void _updatePerson(Map<String, dynamic> person, {String status}) {
    setState(() => person['status'] = status);
  }

  Widget _helpDialog() {
    const String _helpText =
        "Swipe right to accept. Swipe left to reject. Unpinch to enter a new person. Long press to delete.";
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('How to use this widget'),
              subtitle: Text(_helpText),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('DISMISS'),
                    onPressed: () => setState(() => _showHelp = !_showHelp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
