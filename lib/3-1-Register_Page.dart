import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import '3-2-Login_page.dart';

class Register3 extends StatefulWidget {
  const Register3({Key? key}) : super(key: key);

  @override
  State<Register3> createState() => _Register3State();
}

class _Register3State extends State<Register3> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final box = GetStorage();
  bool lodiing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Register',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(
                  hintText: 'email',
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: pass,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'password',
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 40),
            lodiing
                ? CircularProgressIndicator()
                : Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 23)),
                      onPressed: () async {
                        setState(() {
                          lodiing = true;
                        });
                        try {
                          UserCredential creddentiol =
                              await auth.createUserWithEmailAndPassword(
                                  email: email.text, password: pass.text);
                          print('${creddentiol.user!.email}');
                          print('${creddentiol.user!.uid}');
                          box.write('userid', '${creddentiol.user!.uid}');
                          setState(() {
                            lodiing = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen11(),
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          print('${e.code}');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${e.message}"),
                            ),
                          );
                          setState(() {
                            lodiing = false;
                          });
                        }
                      },
                      child: Text("Register now"),
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Alredy have an account?"),
                InkResponse(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen11(),
                          ));
                    });
                  },
                  child: Text(
                    " Log in",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
