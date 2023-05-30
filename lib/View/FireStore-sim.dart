import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firebasesoredata extends StatefulWidget {
  const Firebasesoredata({Key? key}) : super(key: key);

  @override
  State<Firebasesoredata> createState() => _FirebasesoredataState();
}

class _FirebasesoredataState extends State<Firebasesoredata> {
  // CollectionReference firebaseFirestore =
  //     FirebaseFirestore.instance.collection('student');
  // DocumentReference documentReference =
  //     FirebaseFirestore.instance.collection('student').doc('std1');

  String? _ID, _name, _email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Id..',
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
                onChanged: (email) {
                  _ID = email;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'name..',
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
                onChanged: (name) {
                  _name = name;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'email..',
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
                onChanged: (pass) {
                  _email = pass;
                },
              ),
            ),
            SizedBox(height: 30),
            Wrap(
              spacing: 20,
              children: [
                ElevatedButton(
                  onPressed: () {
                    adddata();
                  },
                  child: Text('add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    readdata();
                  },
                  child: Text('read'),
                ),
                ElevatedButton(
                  onPressed: () {
                    updatedata();
                  },
                  child: Text('update'),
                ),
                ElevatedButton(
                  onPressed: () {
                    dalatedata();
                  },
                  child: Text('delate'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  adddata() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('student').doc(_ID);
    Map<String, dynamic> data = {
      'Id': _ID,
      'name': _name,
      'email': _email,
    };
    documentReference.set(data).whenComplete(() {
      print('$_name created');
    });
  }

  void readdata() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('student').doc(_ID);
    documentReference.get().then((value) {
      print(value.get('Id'));
      print(value.get('name'));
      print(value.get('email'));
    });
  }

  updatedata() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('student').doc(_ID);
    Map<String, dynamic> data = {
      'Id': _ID,
      'name': _name,
      'email': _email,
    };
    documentReference.set(data).whenComplete(() {
      print('$_name created');
    });
  }

  dalatedata() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('student').doc(_ID);
    documentReference.delete().whenComplete(() {
      print('delate');
    });
  }
}
