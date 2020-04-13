import 'package:flutter/material.dart';

enum SearchType { web, image, news, shopping }
enum SearchLocation { anywhere, title, text }

class SimplestForm extends StatefulWidget {
  @override
  _SimplestFormState createState() => _SimplestFormState();
}

class _SimplestFormState extends State<SimplestForm> {
  SearchLocation _searchLocation = SearchLocation.anywhere;
  SearchType _searchType = SearchType.web;
  String _searchTerm='';
  double _numberOfResults = 10.0;
  bool _safeSearchOn = true;
  final TextEditingController _controller =
      TextEditingController(text: 'Searching...');
final GlobalKey<FormState> _key = GlobalKey<FormState>();

@override
Widget build(BuildContext context) {
  return Form(
    key: _key,
    onChanged: () {
      print('changed');
    },
    child:   Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Text(
              'Advanced search',
              style: Theme.of(context).textTheme.title,
            ),
            const Text('Search terms'),
            TextField(
              controller: _controller,
              onChanged: (String val) => _searchTerm = val,
            ),
            const Text('Email - if you want results sent to you'),
            TextField(),
            const Text('Number of results'),
            Slider(
              label: _numberOfResults.round().toString(),
              min: 0,
              max: 100,
              divisions: 100,
              value: _numberOfResults,
              onChanged: (double val) => setState(() => _numberOfResults = val),
            ),
            DropdownButton<SearchType>(
              value: _searchType,
              items: const <DropdownMenuItem<SearchType>>[
                DropdownMenuItem<SearchType>(
                  child: Text('Web'),
                  value: SearchType.web,
                ),
                DropdownMenuItem<SearchType>(
                  child: Text('Image'),
                  value: SearchType.image,
                ),
                DropdownMenuItem<SearchType>(
                  child: Text('News'),
                  value: SearchType.news,
                ),
                DropdownMenuItem<SearchType>(
                  child: Text('Shopping'),
                  value: SearchType.shopping,
                ),
              ],
              onChanged: (SearchType val) => setState(() => _searchType = val),
            ),
            Row(
              children: <Widget>[
                Checkbox(
                    value: _safeSearchOn,
                    onChanged: (bool val) =>
                        setState(() => _safeSearchOn = val)),
                const Text('Safesearch on'),
              ],
            ),
            const Text('Terms appearing ...'),
            Row(
              children: <Widget>[
                Radio<SearchLocation>(
                    groupValue: _searchLocation,
                    value: SearchLocation.anywhere,
                    onChanged: (SearchLocation val) =>
                        setState(() => _searchLocation = val)),
                const Text('Search anywhere'),
              ],
            ),
            Row(
              children: <Widget>[
                Radio<SearchLocation>(
                    groupValue: _searchLocation,
                    value: SearchLocation.text,
                    onChanged: (SearchLocation val) =>
                        setState(() => _searchLocation = val)),
                const Text('Search page text'),
              ],
            ),
            Row(
              children: <Widget>[
                Radio<SearchLocation>(
                    groupValue: _searchLocation,
                    value: SearchLocation.title,
                    onChanged: (SearchLocation val) =>
                        setState(() => _searchLocation = val)),
                const Text('Search page title'),
              ],
            ),
            Text(_searchLocation.toString()),
            const RaisedButton(
              child: Text('Submit'),
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }
}
