import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomFonts extends StatefulWidget {
  CustomFonts();

  @override
  _CustomFontsState createState() => _CustomFontsState();
}

class _CustomFontsState extends State<CustomFonts> {
  List<String> loremIpsums;
  bool loading = false;

  @override
  void initState() {
    getLoremIpsums(numberToFetch: 4).then((lorems) {
      loremIpsums = lorems;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context).textTheme.apply(fontSizeDelta: 4.0);
    print(loremIpsums);
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: loading ? <Widget>[SizedBox()]: <Widget>[
              Text(loremIpsums[0]),  // Unstyled
              Text(loremIpsums[1], style: TextStyle(fontFamily: "Courier"),),
              Text(loremIpsums[2], style: TextStyle(fontFamily: 'NanumBrushScript'),),
              Text(loremIpsums[3], style: TextStyle(fontFamily: 'MrDafoe'),),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<String>> getLoremIpsums({@required int numberToFetch}) async {
    setState(() {
      loading = true;
    });
    String _url = Uri.encodeFull(
        "https://loripsum.net/api/$numberToFetch/short/plaintext");
    try {
      http.Response response = await http.get(_url, headers: <String, String>{
        'Accept': 'text/plain',
      });
      return response.body.split('\n\n');
    } catch (e) {
      print('Error in getting Lorem Ipsums: $e');
      rethrow;
    } finally {
      if (mounted) setState(() {
        loading = false;
      });
    }
  }
}
