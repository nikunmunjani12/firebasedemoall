import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Getstorange0 extends StatefulWidget {
  const Getstorange0({Key? key}) : super(key: key);

  @override
  State<Getstorange0> createState() => _Getstorange0State();
}

class _Getstorange0State extends State<Getstorange0> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await box.write('userid', '12345');
              },
              child: Text('Data store'),
            ),
            ElevatedButton(
              onPressed: () async {
                await box.read('userid');
              },
              child: Text('Data read'),
            ),
            ElevatedButton(
              onPressed: () async {
                await box.remove('userid');
              },
              child: Text('Data remove'),
            ),
            ElevatedButton(
              onPressed: () async {
                await box.erase();
              },
              child: Text('Data all remove'),
            )
          ],
        ),
      ),
    );
  }
}
