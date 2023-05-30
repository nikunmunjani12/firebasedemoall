import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '2-LogOut-Get_storange.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({Key? key}) : super(key: key);

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  final box = GetStorage();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Login'),
          onPressed: () async {
            UserCredential credential =
                await auth.createUserWithEmailAndPassword(
                    email: 'munjani@gmail.com', password: '123416');
            print('${credential.user!.email}');
            print('${credential.user!.uid}');
            await box.write('userid', '${credential.user!.uid}');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LogoutScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
