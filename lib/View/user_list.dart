import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  DocumentReference user = FirebaseFirestore.instance
      .collection('Users')
      .doc('7WMngs9GsRQBTZu7g5ne');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // users.add({'name': 'xyz', 'email': 'xyz@gmail.com'});
          // user.update({'name': 'xyz', 'email': 'xyz@gmail.com'});
          user.set({'abcd'});
        },
      ),
      body: FutureBuilder(
        // future: users.get(), //1,2
        future: user.get(), //3
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //   var data = snapshot.data!.docs[0].data(); //1
            // return Center(child: Text('${data}')); //1
            // var data =
            //     snapshot.data!.docs[0].data() as Map<String, dynamic>; //2
            // return Center(child: Text('${data['name']}')); //2
            var data = snapshot.data!.data() as Map<String, dynamic>; //3
            return Center(child: Text('${data['name']}')); //3
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
