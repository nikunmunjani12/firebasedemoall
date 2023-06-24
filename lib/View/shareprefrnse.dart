// import 'package:flutter/material.dart';
//
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// /// save image on cache using shared_preferences throw image's path
// File? imgFile;
// String? imgPath;
// ImagePicker picker = ImagePicker();
//
// class SaveImageLocallyView extends StatefulWidget {
//   const SaveImageLocallyView({Key? key}) : super(key: key);
//
//   @override
//   State<SaveImageLocallyView> createState() => _SaveImageLocallyViewState();
// }
//
// class _SaveImageLocallyViewState extends State<SaveImageLocallyView> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Save Image on Cache"),
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         padding: const EdgeInsets.all(25),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // image
//             if (imgPath != null)
//               Expanded(
//                 child: Image.file(File(imgPath!)),
//               ),
//             TextButton(
//                 onPressed: () {
//                   getImg();
//                 },
//                 child: const Text("Get Image")),
//             const SizedBox(
//               height: 5,
//             ),
//             TextButton(
//                 onPressed: () {
//                   deleteData();
//                 },
//                 child: const Text("Delete Image")),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // get image from gallery
//   void getImg() async {
//     // final pickedImage = await (source: ImageSource.gallery);
//     XFile? file = await picker.pickImage(source: ImageSource.gallery);
//     if (file != null) {
//       saveData(file.path.toString()); // path cache
//       setState(() {
//         imgFile = File(file.path);
//       });
//     }
//   }
//
//   void saveData(String val) async {
//     final sharedPref = await SharedPreferences.getInstance();
//     sharedPref.setString('path', val);
//     getData();
//   }
//
//   void getData() async {
//     final sharedPref = await SharedPreferences.getInstance();
//     setState(() {
//       imgPath = sharedPref.getString('path');
//     });
//   }
//
//   void deleteData() async {
//     final sharedPref = await SharedPreferences.getInstance();
//     sharedPref.remove('path');
//     getData();
//   }
// }


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharepreffernce1 extends StatefulWidget {
  const Sharepreffernce1({super.key});

  @override
  State<Sharepreffernce1> createState() => _Sharepreffernce1State();
}

class _Sharepreffernce1State extends State<Sharepreffernce1> {
  var namevalue = 'no value saved';
  static const String keyName = 'name';
  TextEditingController namecontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: namecontroller,
            decoration: InputDecoration(hintText: 'search'),
          ),
          ElevatedButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.setString(keyName, namecontroller.text.toString());
              },
              child: Text('enter')),
          Text(namevalue)
        ],
      ),
    );
  }

  void getdata() async {
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString(keyName);
    //namevalue=getName!;
    //namevalue=getName!=null?getName:'no value ';
    namevalue = getName ?? 'no value ';
    setState(() {});
  }
}
