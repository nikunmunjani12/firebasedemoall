// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
//
// class Get_StorangeTask extends StatefulWidget {
//   const Get_StorangeTask({Key? key}) : super(key: key);
//
//   @override
//   State<Get_StorangeTask> createState() => _Get_StorangeTaskState();
// }
//
// class _Get_StorangeTaskState extends State<Get_StorangeTask> {
//   final box = GetStorage();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 await box.erase();
//               },
//               child: Text("logOut"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// /////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '1-Get_storange.dart';
//
// class Demo extends StatefulWidget {
//   const Demo({Key? key}) : super(key: key);
//
//   @override
//   State<Demo> createState() => _DemoState();
// }
//
// class _DemoState extends State<Demo> {
//   final box = GetStorage();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Login'),
//           onPressed: () async {
//             await box.write('userid', '12345');
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Get_StorangeTask(),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// //////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '1-Get_storange.dart';
// import '2-demo.dart';
//
// void main() async {
//   await GetStorage.init();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   // final box = GetStorage();
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final box = GetStorage();
//     return MaterialApp(
//       home: box.read('userid') == null ? Demo() : Get_StorangeTask(),
//     );
//   }
// }
