import 'dart:convert';

class Person {
  // Constructor only needed b/c name is a map of strings
  // and needs to be initialized
  Person() {
    name = <String, String>{};
  }
  // The typed deserialization pattern for a single person
  static Person fromJson(String jsonString) {
    final Map<String, dynamic> data = jsonDecode(jsonString);
    return Person()
      ..id = data['id']
      ..name = data['name']
      ..email = data['email']
      ..imageUrl = data['imageUrl'];
  }
  // The typed deserialization pattern for lists of people
  static List<Person> fromJsonArray(String jsonString) {
    final Iterable<dynamic> data = jsonDecode(jsonString);
    return data.map<Person>((dynamic d) => Person()
      ..id = d['id']
      ..name = <String, String>{'first':d['first'], 'last':d['last']}
      ..email = d['email']
      ..imageUrl = d['imageUrl']).toList();
  }
  // The actual properties of a person
  int id;
  Map<String, String> name;
  String email;
  String imageUrl;
}
