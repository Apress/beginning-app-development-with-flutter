void main() {
  final int x = 10; // Integers
  const double y = 2.0; // IEEE754 floating point numbers
  bool z = true; // Booleans
  String s = "hello"; // Strings
  dynamic d; // Dynamic variables can change types
  d = x; // at any time. Use sparingly.
  d = y;
  d = z;

// Type inferrence
  var i = 10; // i is an int.
  i = 12; // Yes, b/c i is an int.
//i = "twelve";       // No! i is not a String.
  var str = "ten"; // str is a String.
  str = "a million"; // Yep, works great.
//str = 1000000.0;    // Nope! str is not a double.

// Functions are objects
  Function sayHi = (String name) => print('Hello, ' + name);
  Function meToo = sayHi;
// meToo("Tobias");

  int triple(int val) {
    return val * 3;
  }

  Function triple1 = (int val) {
    return val * 3;
  };
  Function triple2 = (int val) => val * 3;

// Square brackets means a list/array
  List<dynamic> list = [1, "two", 3];
// Angle brackets show the type - Dart supports Generics
// Two ways to iterate a list
//list.forEach((d) => print(d));
  for (var d in list) {
    //print(d);
  }

// Curly braces means a map
  Map<String, dynamic> person = {
    "first": "Gob",
    "last": "Bluth",
    "dob": DateTime.parse("1972-07-16"),
    "email": "amazingGob@gmail.com",
  };
// You reference a map member with square brackets
//print(person['first'] + " was born "+ person['dob'].toString());

  String themeSong = '''
    Now the story of a wealthy family
    who lost everything
    And the one son who had no choice
    but to keep them all together.
    ''';
  //print(themeSong);
}
