import 'package:flutter/material.dart';

class homepage3 extends StatefulWidget {
  const homepage3({Key? key}) : super(key: key);

  @override
  State<homepage3> createState() => _homepage3State();
}

class _homepage3State extends State<homepage3> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "welcome",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
      ),
    );
  }
}
