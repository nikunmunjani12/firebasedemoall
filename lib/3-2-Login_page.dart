import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '3-1-Register_Page.dart';
import '3-3-Home_Page.dart';

class LoginScreen11 extends StatefulWidget {
  const LoginScreen11({Key? key}) : super(key: key);

  @override
  State<LoginScreen11> createState() => _LoginScreen11State();
}

class _LoginScreen11State extends State<LoginScreen11> {
  final box = GetStorage();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool lodding = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
        SizedBox(
          height: 100,
        ),
        Text(
          'Login',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: email,
            decoration: InputDecoration(
              hintText: 'email',
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: pass,
            decoration: InputDecoration(
              hintText: 'password',
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Center(
          child: lodding == true
              ? CircularProgressIndicator()
              : Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 25)),
                    child: Text('Login'),
                    onPressed: () async {
                      setState(() {
                        lodding = true;
                      });
                      try {
                        UserCredential credential =
                            await auth.signInWithEmailAndPassword(
                                email: email.text, password: pass.text);
                        print('${credential.user!.email}');
                        print('${credential.user!.uid}');
                        box.write('userid', '${credential.user!.uid}');
                        setState(() {
                          lodding = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => homepage3(),
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
                          lodding = false;
                        });
                      }
                    },
                  ),
                ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            InkResponse(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register3(),
                    ),
                  );
                });
              },
              child: Text(
                " Signup",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ]),
    ));
  }
}
