import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'LayoutDrawer.dart';
import 'utilities.dart';

class WriteNewFile extends StatefulWidget {
  @override
  _WriteNewFileState createState() => _WriteNewFileState();
}

class _WriteNewFileState extends State<WriteNewFile> {
  String _filename = 'newFile.txt';
  String _text = 'No text yet';
  String _message = '';
  bool _errorStatus = false;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _filename);
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
    final TextStyle _messageStyle = _errorStatus
        ? TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
        : Theme.of(context).textTheme.body1;
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          Text('Write a new file: $_filename'),
          TextField(
            decoration: InputDecoration(labelText: 'Filename'),
            controller: _controller,
            onChanged: (String value) {
              setState(() {
                _filename = value;
              });
            },
          ),
          RaisedButton(
            child: Icon(Icons.open_in_browser),
            onPressed: () async {
              final Directory documents = await getApplicationDocumentsDirectory();
              setState(() {
                _errorStatus = false;
                _text = makeRandomText(50);
              });
              // Write the file
              try {
                final File file = File('${documents.path}/$_filename');
                await file.writeAsString(_text);
                // Modal success
                _message = '$_filename was saved with the message "$_text"';
              } catch (e) {
                _errorStatus = true;
                _message = 'Error: $e';
              } finally {
                setState(() {});
              }
            },
          ),
          Text(
            _text,
            style: TextStyle(fontFamily: 'Courier'),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
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
