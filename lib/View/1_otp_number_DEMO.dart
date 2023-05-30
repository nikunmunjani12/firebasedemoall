import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '2_Otp_code_DEMO.dart';

class Otpenternumber extends StatefulWidget {
  const Otpenternumber({Key? key}) : super(key: key);

  @override
  State<Otpenternumber> createState() => _OtpenternumberState();
}

class _OtpenternumberState extends State<Otpenternumber> {
  TextEditingController number = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffe1f5fe),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                      hintText: 'Number..',
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      auth.verifyPhoneNumber(
                        phoneNumber: '+91${number.text}',
                        verificationCompleted: (phoneAuthCredential) {
                          print('Verify');
                        },
                        verificationFailed: (error) {
                          print('Error');
                        },
                        codeSent: (verificationId, forceResendingToken) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Otp5(
                                Id: verificationId,
                                phone: number.text,
                                token: forceResendingToken,
                              ),
                            ),
                          );
                        },
                        codeAutoRetrievalTimeout: (verificationId) {
                          print('TimeOut');
                        },
                      );
                    } on FirebaseException catch (e) {
                      print('${e.code}');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${e.message}'),
                        ),
                      );
                    }
                  },
                  child: Text('Send'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
