import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_clock/controller/controller.Getx.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(imagecontroller());
    return Obx(
      () => AnimatedContainer(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              controller.ImageList[controller.ImageIndex.value],
            ),
            fit: BoxFit.cover,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        duration: Duration(milliseconds: 300),

        child: Scaffold(backgroundColor: Colors.transparent),
      ),
    );
  }
}
