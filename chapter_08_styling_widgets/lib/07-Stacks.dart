import 'package:flutter/material.dart';

class Stacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ch 8 - Stacks')),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(40),
            height: 300,
            width: 300,
child: 
Card(
  elevation: 20.0,
  child: Stack(
    children: <Widget>[
      Image.asset("6.jpg", width: 400, fit: BoxFit.cover),
      Positioned(
        top: 10,
        left: 10,
        child: Text(
          "Sandeep Patel",
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Colors.white),
        ),
      ),
      Positioned(
        bottom: 30,
        right: 10,
        child: Text("Email: s.patel@us.com",
            style: Theme.of(context)
                .textTheme
                .body2
                .copyWith(color: Colors.white)),
      ),
      Positioned(
        bottom: 10,
        right: 10,
        child: Text("Phone: +1 (555) 786-3512",
            style: Theme.of(context)
                .textTheme
                .body2
                .copyWith(color: Colors.white)),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        height: 100,
        width: 100,
        child: FlutterLogo(),
      )
    ],
  ),
),
          ),
          Container(
            margin: EdgeInsets.all(40),
            height: 300,
            width: 300,
            child: Card(
              child: Stack(
                children: <Widget>[
                  Image.asset("6.jpg"),
                  Column(
                    children: <Widget>[
                      Text(
                        "Sandeep Patel",
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      Text("Email: s.patel@us.com",
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(color: Colors.white)),
                      Text("Phone: +1 (555) 786-3512",
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
