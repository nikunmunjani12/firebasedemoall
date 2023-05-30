import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleDemo extends StatefulWidget {
  const GoogleDemo({Key? key}) : super(key: key);

  @override
  State<GoogleDemo> createState() => _GoogleDemoState();
}

class _GoogleDemoState extends State<GoogleDemo> {
  FirebaseAuth auth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Google'),
              onPressed: () async {
                GoogleSignInAccount? account = await googleSignIn.signIn();

                GoogleSignInAuthentication authentication =
                    await account!.authentication;

                OAuthCredential credential = GoogleAuthProvider.credential(
                    accessToken: authentication.accessToken,
                    idToken: authentication.idToken);

                UserCredential userCredential =
                    await auth.signInWithCredential(credential);

                print('${userCredential.user!.displayName}');
                print('${userCredential.user!.uid}');
                print('${userCredential.user!.photoURL}');
                print('${userCredential.user!.email}');
                // box.write('userid', '${userCredential.user!.uid}');
              },
            ),
            ElevatedButton(
              child: Text('Google'),
              onPressed: () async {
                await googleSignIn.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
