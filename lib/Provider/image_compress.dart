// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:image_picker/image_picker.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   File? originalImage;
//   File? compressedImage;
//   String compressedImagePath = "/storage/emulated/0/Download/";
//
//   Future pickImage() async {
//     final pickedFile =
//         await ImagePicker.platform.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         originalImage = File(pickedFile.path);
//       });
//     }
//   }
//
//   Future compressImage() async {
//     if (originalImage == null) return null;
//
//     final compressedFile = await FlutterImageCompress.compressAndGetFile(
//       originalImage!.path,
//       "$compressedImagePath/file1.jpg",
//       quality: 10,
//     );
//
//     if (compressedFile != null) {
//       setState(() {
//         //compressedImage = compressedFile.toString();
//       });
//       print(await originalImage!.length());
//       print(await compressedFile.length());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           Expanded(
//             child: SizedBox(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Original Image",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   originalImage != null
//                       ? Image.file(originalImage!)
//                       : TextButton(
//                           onPressed: pickImage,
//                           child: Text("Pick an Image"),
//                         ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: SizedBox(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Compressed Image",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   compressedImage != null
//                       ? Image.file(compressedImage!)
//                       : TextButton(
//                           onPressed: compressImage,
//                           child: Text("Compress Image"),
//                         ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  File? _compressedFile;

  Future<void> compress() async {
    var result = await FlutterImageCompress.compressAndGetFile(
      _imageFile!.absolute.path,
      _imageFile!.path + 'compressed.jpg',
      quality: 66,
    );
    setState(() {
      // _compressedFile = result[];
    });
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Image Compress'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Text('Before'),
            if (_imageFile != null)
              Image.file(
                _imageFile!,
                height: 200,
                width: 200,
              ),
            if (_imageFile != null) Text('${_imageFile!.lengthSync()} bytes'),
            const Divider(),
            const Text('After'),
            if (_compressedFile != null)
              Image.file(
                _compressedFile!,
                height: 200,
                width: 200,
              ),
            if (_compressedFile != null)
              Text('${_compressedFile!.lengthSync()} bytes'),
            const Divider(),
            ElevatedButton(
              onPressed: () async {
                await pickImage();
              },
              child: const Text('Select Image'),
            ),
            ElevatedButton(
              onPressed: () async {
                await compress();
              },
              child: const Text('Compress'),
            )
          ],
        ),
      ),
    );
  }
}
