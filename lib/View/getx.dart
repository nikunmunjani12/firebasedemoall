import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Demo2 extends StatefulWidget {
  const Demo2({Key? key}) : super(key: key);

  @override
  State<Demo2> createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  Demo demo = Get.put(Demo());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Demo>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.update();
            },
          ),
        );
      },
    );
  }
}

class Demo extends GetxController {
  int select = 0;
  updateValue(value) {
    select = value;
    update();
  }
}
