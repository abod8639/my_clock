import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_clock/controller/controller.Getx.dart';
import 'package:my_clock/view/page/disktop.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Imagecontroller());
    return desktop(controller: controller);
  }
}
