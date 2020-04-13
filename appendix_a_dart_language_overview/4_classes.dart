import 'dart:convert';
import 'package:crypto/crypto.dart';

class Name {
  String first;
  String last;
  String suffix;
  // A getter
  String getFullName() {
    //return first + " " + last + ((suffix != null) ? (", " + suffix) : "");
    //String fullName = '${name['first']} ${name['last']}, ${name['suffix']}';
    // No. Avoid.
    String fullName = this.first + " " + this.last + ", " + this.suffix;
    // Better.
    String fullName2 = first + " " + last + ", " + suffix;
    return fullName;
  }
  // The use of 'this.' is understood and discouraged
  // No setter means that it is read-only
}

class Person {
  int id;
  Name name; // Another class can be used as a type
  String email;
  String phone;
  String _password;
  // Typical constructor
  Person() {
    name = Name()..first=""..last="";
  }
  // Named parameters
  Person.withName({String firstName, String lastName}) {
    name = Name()
      ..first = firstName
      ..last = lastName;
  }
  // Named constructor
  Person.byId(int id) {
    // Maybe go fetch from a service by the provided id
  }
  
  // Constructor parameter shorthand
  // Person(this.email, this.phone) {}

  set password(String value) {
    _password = value;
  }

  String get hashedPassord {
    return sha512.convert(utf8.encode(_password)).toString();
  }

  // A method
  void save() {
    // Write to a database somehow.
  }
}

class Employee extends Person with Employment {
  String position;
}

mixin Employment {
  String employer;
  String businessPhone;
  void callBoss() {
    print('Calling my boss');
  }
}

void main() {
  // When instantiating, the keyword 'new' is discouraged.
  Name name = Name();
  name.first = "Gob";
  name.last = "Bluth";

Person p = Person()
    ..id = 100
    ..name = name
    ..email = 'gob@bluth.com'
    ..save();
  p.password = "MagicMan123";
  print(p.hashedPassord);

Person p2 = Person.withName(firstName: "Lindsay", lastName: "Fünke");

  final Employee e = Employee();
  e.employer = "The Bluth Company";
  e.callBoss();
  //sendEmail(subject:'Popcorn in the breakroom', toAddress:'ceo@bluthcompany.com');
}

void sendEmail({String toAddress, String subject}) {
  // send the email here
}
