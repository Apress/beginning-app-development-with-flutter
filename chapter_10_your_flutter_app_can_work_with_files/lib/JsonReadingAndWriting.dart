import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'LayoutDrawer.dart';
import 'utilities.dart';
import 'dart:io';
import 'dart:convert';

class JsonReadingAndWriting extends StatefulWidget {
  @override
  _JsonReadingAndWritingState createState() => _JsonReadingAndWritingState();
}

class _JsonReadingAndWritingState extends State<JsonReadingAndWriting> {
  String _assetFilename = "database.json";
  String _filename = "database.json";
  String _message = "";
  EditingStatus _editingStatus = EditingStatus.none;
  Person _person = new Person();
  bool _errorStatus = false;
  TextEditingController _controller;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // To keep this demo more understandable, we made this a Map
  // but in practice, it would have been a Person class/object.
  List<Person> _people = new List<Person>();

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: _filename);
  }

  @override
  Widget build(BuildContext context) {
    print("rebuilding $_person");

    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: _body,
    );
  }

  Widget get _body {
    TextStyle _messageStyle = _errorStatus
        ? TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
        : Theme.of(context).textTheme.body1;
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          Text("Reading and writing JSON from $_filename"),
          RaisedButton(
            child: Text('Refresh the database file'),
            onPressed: _refreshAssetsFile,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Filename"),
            controller: _controller,
            onChanged: (value) {
              setState(() {
                _filename = value;
              });
            },
          ),
          RaisedButton(
            child: Text("Load the database file"),
            onPressed: _loadDatabaseFile,
          ),
          new DropdownButton<Person>(
            items: _people.map((Person person) {
              return new DropdownMenuItem<Person>(
                value: person,
                child: new Text('${person.firstName} ${person.lastName}'),
              );
            }).toList(),
            onChanged: _selectCurrentPerson,
          ),
          if (_editingStatus == EditingStatus.none)
            RaisedButton(
              child: Text("Add New Person"),
              onPressed: _prepareAddPerson,
            ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: "First name"),
                  onSaved: (value) {
                    setState(() {
                      _person.firstName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Last name"),
                  onSaved: (value) {
                    setState(() {
                      _person.lastName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Occupation"),
                  onSaved: (value) {
                    setState(() {
                      _person.occupation = value;
                    });
                  },
                ),
              ],
            ),
          ),
          if (_editingStatus == EditingStatus.adding)
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Save"),
                  onPressed: _savePerson,
                ),
                RaisedButton(
                  child: Text("Cancel"),
                  onPressed: _cancel,
                ),
              ],
            )
          else
            if (_editingStatus == EditingStatus.modifying)
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Save"),
                    onPressed: _savePerson,
                  ),
                  RaisedButton(
                    child: Text("Cancel"),
                    onPressed: _cancel,
                  ),
                  RaisedButton(
                    child: Text("Delete"),
                    onPressed: _deletePerson,
                  ),
                ],
              ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Text(
              _message,
              style: _messageStyle,
            ),
          ),
        ],
      ),
    );
  }

  // Clears out the textboxes so a brand new person can be added to the list
  void _prepareAddPerson() {
    setState(() {
      _editingStatus = EditingStatus.adding;
      _person = new Person();
    });
  }

  void _cancel() {
    _formKey.currentState.reset();
    setState(() {
      _editingStatus = EditingStatus.none;
      _person = new Person();
    });
  }

  void _selectCurrentPerson(Person person) {
    setState(() {
      _editingStatus = EditingStatus.modifying;
      _person = person;
      print("Selected $_person");
    });
  }

  // Upserts the current person to the list of people. ie. If the person doesn't exist
  // already, add them. If they do exist, update them.
  void _savePerson() {
    setState(() {
      _formKey.currentState.save();
      if (_editingStatus == EditingStatus.adding) {
        _person.id = new Uuid().v1();
        _people.add(_person);
      }
      // Not sure we have to do anything; we're already putting the names and stuff into _person which is a reference to the person in memory.
      //else
      //Person thePerson = _people.firstWhere((Person p) => p.id == _person.id);

      _editingStatus = EditingStatus.none;
      _formKey.currentState.reset();
      _saveDatabaseFile();
    });
  }

  // Delete a person from the list of people.
  void _deletePerson() {
    //_saveDatabaseFile();
  }

  // Read from the assets file and load it into the local 'database' file.
  void _refreshAssetsFile() async {
    String _stringData = await rootBundle.loadString('assets/$_assetFilename');
    Directory documents = await getApplicationDocumentsDirectory();
    _errorStatus = false;
    File file = File('${documents.path}/$_filename');
    try {
      await file.writeAsString(_stringData);
      setState(() {
        _message = '$_filename now has this text inside it: "$_stringData"';
      });
    } catch (ex) {
      setState(() {
        _errorStatus = true;
        _message = 'Error: $ex';
      });
    }
  }

  // Reads from a flat 'database' file in JSON format and saves to state (_person)
  void _loadDatabaseFile() async {
    Directory documents = await getApplicationDocumentsDirectory();
    _errorStatus = false;
    File file = File('${documents.path}/$_filename');
    file.readAsString().then((String text) {
      setState(() {
        _message = '$_filename has this text inside it: "$text"';
        Map<String, dynamic> db = json.decode(text);
        List<dynamic> ppl = db["people"];
        _people = ppl
            .map((dynamic p) => Person(
                id: p["id"],
                firstName: p["firstName"],
                lastName: p["lastName"],
                occupation: p["occupation"]))
            .toList();
      });
    }).catchError((Object e) {
      setState(() {
        _errorStatus = true;
        _message = 'Error: $e';
      });
    });
  }

  void _saveDatabaseFile() async {
    Directory documents = await getApplicationDocumentsDirectory();
    setState(() {
      _errorStatus = false;
    });
    File file = File('${documents.path}/$_filename');
    Map<String, dynamic> jsonObject = <String, dynamic>{"people": _people};

    try {
      await file.writeAsString(json.encode(jsonObject));
    } catch (e) {
      print("Problem serializing: $e");
      setState(() {
        _errorStatus = true;
        _message = 'Error: $e';
      });
    }
  }
}

class Person {
  String id;
  String firstName;
  String lastName;
  String occupation;

  Person({this.id, this.firstName, this.lastName, this.occupation});

  String toString() {
    return json.encode(this);
  }

  Map<String,dynamic> toJson() => <String, dynamic>{
        "id": this.id,
        "firstName": this.firstName,
        "lastName": this.lastName,
        "occupation": this.occupation
      };
}

enum EditingStatus { none, adding, modifying }
