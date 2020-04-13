// import the Dart package needed for all Flutter apps
import 'package:flutter/material.dart';

// Here is main calling runApp
void main() => runApp(MaterialApp(home: RootWidget()));
 
// And here is your root widget
class RootWidget extends StatelessWidget {
Widget build(BuildContext context) {
  return FancyHelloWidget();
  // return Person(firstName:"Sarah", lastName:"Ali");
}
}

class FancyHelloWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("A fancier app"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text("Hello world"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.thumb_up),
          onPressed: () => {},
        ),
      ),
    );
  }
}

class Person extends StatelessWidget {
  final String firstName;
  final String lastName;
  Person({this.firstName, this.lastName}) {} 
  Widget build(BuildContext context) {
    return Container(child: Text('$firstName $lastName'));
  }
}