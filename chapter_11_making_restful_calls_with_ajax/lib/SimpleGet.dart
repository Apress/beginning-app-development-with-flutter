import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'sensitiveConstants.dart';

// Demonstrates a very simple GET request
class SimpleGet extends StatefulWidget {
  @override
  _SimpleGetState createState() => _SimpleGetState();
}

class _SimpleGetState extends State<SimpleGet> {
  TextEditingController _searchTextController;
  List<Widget> _photoWidgets;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _photoWidgets = <Widget>[];
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Get by brute force'),
      ),
      body: _body,
      floatingActionButton: _fab,
    );
  }

  Widget get _body {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
      child: Column(
        children: <Widget>[
          const Text('Cool photos'),
          TextField(
            controller: _searchTextController,
          ),
          Expanded(
            child: GridView.extent(
              maxCrossAxisExtent: 300,
              children: _photoWidgets,
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton get _fab {
    return FloatingActionButton(
      child: Icon(Icons.search),
      onPressed: () => fetchPhotos(_searchTextController.text),
    );
  }

  // Receives the search string and sets the List<photo> to what comes back
void fetchPhotos(String searchText) async {  // ignore:avoid_void_async
  final String encodedSearchString = Uri.encodeFull(searchText);
  final String url =
      'https://api.pexels.com/v1/search?query=$encodedSearchString&per_page=15&page=1';
  final Response response = await get(
    Uri.encodeFull(url),
    headers: <String, String>{
      'Accept': 'application/json',
      'Authorization': pexelsApiKey,
    },
  );

  final Map<String, dynamic> responseBody = json.decode(response.body);
  //final String nextPageURL = responseBody['next_page'];
  final List<dynamic> photosDynamic = responseBody['photos'];
  final List<Photo> photos = photosDynamic.map<Photo>((dynamic p) {
    final Photo photo = Photo();
    photo.height = p['height'];
    photo.width = p['width'];
    photo.url = p['url'];
    photo.photographer = p['photographer'];
    photo.src = p['src'];
    return photo;
  }).toList();

  // final List<dynamic> photosSrc =
  //     photosDynamic.map<dynamic>((dynamic p) => p['src']).toList();
  // final List<dynamic> photosSrcSmall =
  //     photosSrc.map<dynamic>((dynamic p) => p['large']).toList();

  final List<Widget> widgets = photos
      .map<Widget>((Photo p) => Container(
            margin: const EdgeInsets.all(5.0),
            child: Stack(
              children: <Widget>[
                Image.network(p.src['large'],
                    height: 300, width: 300, fit: BoxFit.cover),
                Text(
                  p.photographer,
                  style: Theme.of(context).textTheme.caption.copyWith(color:Colors.white),
                ),
              ],
            ),
          ))
      .toList();
  setState(() {
    _photoWidgets = widgets;
  });
}
}

class Photo {
  Photo();

  Photo.fromJson(Map<String, dynamic> data) {
    width = data['width'];
    height = data['height'];
    url = data['url'];
    photographer = data['photographer'];
    src = data['src'];
  }

  int width;
  int height;
  String url;
  String photographer;
  Map<String, dynamic> src;
}

enum ImageSize {
  original,
  large,
  large2x,
  medium,
  small,
  portrait,
  landscape,
  tiny
}
