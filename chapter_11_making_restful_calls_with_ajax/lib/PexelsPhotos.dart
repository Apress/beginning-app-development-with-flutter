import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'sensitiveConstants.dart' show pexelsApiKey; // Remember, you'll need to put your own API key in a file called sensitiveConstants.dart to make this work for you.

// Demonstrates a simple FutureBuilder
class PexelsPhotos extends StatefulWidget {
  @override
  _PexelsPhotosState createState() => _PexelsPhotosState();
}

class _PexelsPhotosState extends State<PexelsPhotos> {
  TextEditingController _searchTextController;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
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
        title: const Text('Simple Get with FutureBuilder'),
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
            child: FutureBuilder<Response>(
              future: fetchPhotos(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Container(child: const CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text('Oh no! Error! ${snapshot.error}');
                }
                if (!snapshot.hasData) {
                  return const Text('Nothing to show');
                }
                final Map<String, dynamic> responseBody =
                    json.decode(snapshot.data.body);
                final int statusCode = snapshot.data.statusCode;
                if (statusCode > 299) {
                  return Text('Server error: $statusCode');
                }
                //print(responseBody);
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
                // And convert the List<Photo>s to a List<Widget>s to display
                final List<Widget> widgets = photos
                    .map<Widget>((Photo p) => Container(
                          margin: const EdgeInsets.all(5.0),
                          child: Stack(
                            children: <Widget>[
                              Image.network(p.src['large'],
                                  height: 300, width: 300, fit: BoxFit.cover),
                              Text(
                                'By ${p.photographer}',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ))
                    .toList();
                return GridView.extent(
                  maxCrossAxisExtent: 300,
                  children: widgets,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton get _fab {
    return FloatingActionButton(
      child: Icon(Icons.search),
      onPressed: () => setState(() {}),
    );
  }

  // Retrieves the search string and sets the List<photo> to what 
  // comes back from the API endpoint -- pexels.com in this case.
  Future<Response> fetchPhotos() {
    final String encodedSearchString =
        Uri.encodeFull(_searchTextController.text);
    final String url =
        'https://api.pexels.com/v1/search?query=$encodedSearchString&per_page=15&page=1';
    final Future<Response> response = get(
      Uri.encodeFull(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': pexelsApiKey,
      },
    );
    return response;
  }

  //   List<dynamic> photosSrc =
  //       photosDynamic.map<dynamic>((dynamic p) => p['src']).toList();
  //   List<dynamic> photosSrcSmall =
  //       photosSrc.map<dynamic>((dynamic p) => p['large']).toList();

  //   List<Widget> widgets = photos
  //       .map<Widget>((Photo p) => Container(
  //             margin: const EdgeInsets.all(5.0),
  //             child: Stack(
  //               children: <Widget>[
  //                 Image.network(p.src['large'],
  //                     height: 300, width: 300, fit: BoxFit.cover),
  //                 Text(
  //                   p.photographer,
  //                   style: Theme.of(context).textTheme.caption.copyWith(color:Colors.white),
  //                 ),
  //               ],
  //             ),
  //           ))
  //       .toList();
  //   setState(() {
  //     _photoWidgets = widgets;
  //   });
  // }
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
