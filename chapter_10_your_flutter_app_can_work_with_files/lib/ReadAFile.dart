import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'LayoutDrawer.dart';
import 'dart:io';

class ReadAFile extends StatefulWidget {
  @override
  _ReadAFileState createState() => _ReadAFileState();
}

class _ReadAFileState extends State<ReadAFile> {
  String _filename = "newFile.txt";
  String _text = "No text yet";
  String _message = "";
  bool _errorStatus = false;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: _filename);
  }

  @override
  Widget build(BuildContext context) {
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
          Text("Reading from $_filename"),
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
            child: Icon(Icons.open_in_browser),
            onPressed: () async {
              Directory documents = await getApplicationDocumentsDirectory();
              _errorStatus = false;
              File file = File('${documents.path}/$_filename');
              try {
              String text = await file.readAsString();
                setState(() {
                  _text = text;
                  _message = '$_filename has this text inside it: "$_text"';
                });
              } catch(e) {
                setState(() {
                  _errorStatus = true;
                  _message = 'Error: $e';
                });
              }
            },
          ),
          Text(
            _text,
            style: TextStyle(fontFamily: "Courier"),
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
}
