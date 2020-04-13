import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  Person() {
    name = <String, String>{};
  }

  Person.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    email = data['email'];
    imageUrl = data['imageUrl'];
  }

  Person.fromDocumentSnapshot(DocumentSnapshot data) {
    documentID = data.documentID;
    imageUrl = data['imageUrl'];
    email = data['email'];
    name = <String, String>{
      'first': data['name']['first'],
      'last': data['name']['last']
    };
  }

  String documentID;
  Map<String, String> name;
  String email;
  String imageUrl;
}
