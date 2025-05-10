import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:my_clock/app/ImageList.dart';
import 'package:my_clock/controller/controller.Getx.dart';
import 'package:my_clock/view/widget/Button_Row.dart';
import 'package:my_clock/view/widget/GetTime.dart';
import 'package:my_clock/view/widget/TimeName.dart';
import 'package:my_clock/view/widget/myAppBar.dart';

class phone extends StatelessWidget {
  const phone({super.key, required this.controller});

  final Imagecontroller controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        curve: Curves.easeInOut,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageList[controller.ImageIndex.value]),
            fit: BoxFit.cover,
          ),
          // color: Colors.transparent,
        ),

        duration: Duration(milliseconds: controller.delay),

        child: Scaffold(
          backgroundColor: Colors.transparent,

          appBar: myAppBar(controller),

          body: Container(
            color: Colors.transparent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Button_Row(),

                  GetTime(controller: controller),

                  TimeName(),
                ],
              ),
            ),
          ).asGlass(
            tintColor: Colors.black,
            frosted: true,
            enabled: true,
            blurY: 1.5,
            blurX: 1.5,
            tileMode: TileMode.clamp,
          ),
        ),
      ),
    );
  }
}
