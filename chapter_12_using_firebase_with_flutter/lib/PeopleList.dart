import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Person.dart';

class PeopleList extends StatefulWidget {
  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People Maintenance'),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/peopleUpsert');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget get body {
    return StreamBuilder<QuerySnapshot>(
      stream: fetchPeople(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Text('Oh no! Error! ${snapshot.error}');
        }
        if (!snapshot.hasData) {
          return const Text('No people found');
        }
        final List<Widget> widgets =
            snapshot.data.documents.map<Widget>((DocumentSnapshot p) {
          final Person person = Person.fromDocumentSnapshot(p);

          return InkWell(
            child: GestureDetector(
              onTap: () {
                print('tapped');
                Navigator.pushNamed<dynamic>(context, '/peopleUpsert',
                        arguments: person)
                    .then((dynamic person) {
                  print(
                      'Do something with person returned: ${person.name['first']}');
                });
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: Stack(
                  children: <Widget>[
                    if (person.imageUrl != null)
                      Image.network(person.imageUrl,
                          height: 300, width: 300, fit: BoxFit.cover)
                    else
                      Image.asset('lib/assets/images/NoImage.jpg'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            '${p['name']['first']} ${p['name']['last']}',
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            deletePerson(person);
                          },
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        p['email'],
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList();
        return GridView.extent(
          maxCrossAxisExtent: 300,
          children: widgets,
        );
      },
    );
  }

  Stream<QuerySnapshot> fetchPeople() {
    return Firestore.instance
        .collection('people')
        .limit(100) // Just in case there's a lot of documents
        .snapshots();
  }

  void deletePerson(Person personToDelete) {
    // Delete the person document
    Firestore.instance
        .collection('people')
        .document(personToDelete.documentID)
        .delete()
        .catchError((dynamic error) {
      print('Error! $error');
    });
  }
}
