import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '0_OTP_Code_.dart';

class SendOtp extends StatefulWidget {
  const SendOtp({Key? key}) : super(key: key);

  @override
  State<SendOtp> createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: Text('send'),
              onPressed: () async {
                await auth.verifyPhoneNumber(
                  phoneNumber: '+91 7567417761',
                  verificationCompleted:
                      (PhoneAuthCredential phoneAuthCredential) {
                    print('verifyed');
                  },
                  verificationFailed: (error) {
                    print('Error');
                  },
                  codeSent: (verificationId, forceResendingToken) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyOtp(
                            id: verificationId,
                            token: forceResendingToken,
                          ),
                        ));
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {
                    log('TIme Out');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
