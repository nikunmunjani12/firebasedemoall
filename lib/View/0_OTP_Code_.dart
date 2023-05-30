import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key, required this.id, this.token}) : super(key: key);
  final String id;
  final token;

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  TextEditingController otp = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  int second = 15;
  bool isResend = false;

  void Timerdemo() {
    Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      second--;

      if (second == 0) {
        timer.cancel();
        setState(() {});
        second = 15;
        isResend = true;
      }
    });
  }

  @override
  void initState() {
    Timerdemo();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: otp,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    smsCode: otp.text, verificationId: widget.id);
                UserCredential userCredential =
                    await auth.signInWithCredential(credential);
                print('${userCredential.user!.phoneNumber}');
                print('${userCredential.user!.uid}');
              },
              child: const Text('Verify'),
            ),
            Text(
              "$second",
              style: TextStyle(fontSize: 30),
            ),
            isResend
                ? ElevatedButton(
                    onPressed: () async {
                      await auth.verifyPhoneNumber(
                        phoneNumber: '+91  7567417761',
                        verificationCompleted: (phoneAuthCredential) {
                          print('verifyed');
                        },
                        verificationFailed: (error) {
                          print('ERROR');
                        },
                        codeSent: (verificationId, forceResendingToken) {
                          setState(() {});
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyOtp(
                                  id: verificationId,token:forceResendingToken ,
                                  // token: forceResendingToken,
                                ),
                              ));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {
                          print('Time out');
                        },
                        forceResendingToken: widget.token,
                      );
                      setState(() {});
                      isResend = false;
                      Timerdemo();
                    },
                    child: Text("Redend otp"),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
