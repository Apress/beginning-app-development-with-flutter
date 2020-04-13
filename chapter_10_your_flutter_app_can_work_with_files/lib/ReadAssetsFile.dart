import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LayoutDrawer.dart';

class ReadAssetsFile extends StatefulWidget {
  @override
  _ReadAssetsFileState createState() => _ReadAssetsFileState();
}

class _ReadAssetsFileState extends State<ReadAssetsFile> {
  String _text = "No text yet";
  String _message = "";
  bool _errorStatus = false;

  @override
  void initState() {
    super.initState();
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
          RaisedButton(
            child: Icon(Icons.open_in_browser),
            onPressed: () async {
              _errorStatus = false;
              try {
                _message = await rootBundle.loadString('assets/database.json');
              } catch (e) {
                _errorStatus = true;
                _message = 'Error: $e';
              }
              setState(() {});
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
