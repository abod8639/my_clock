import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:my_clock/app/ImageList.dart';
import 'package:my_clock/controller/controller.Getx.dart';
import 'package:my_clock/view/widget/myAppBar.dart';
import 'package:my_clock/view/widget/myButton.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Imagecontroller());
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
                  const Button_Row(),

                  GetTime(controller: controller),

                  const TimeName(),
                ],
              ),
            ),
          ).asGlass(
            tintColor: Colors.black,
            frosted: false,
            enabled: true,
            blurY: 2.5,
            blurX: 2.5,
            tileMode: TileMode.clamp,
          ),
        ),
      ),
    );
  }
}

class GetTime extends StatelessWidget {
  const GetTime({super.key, required this.controller});

  final Imagecontroller controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        controller.currentTime.value,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class TimeName extends StatelessWidget {
  const TimeName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 120,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Text>[
        Text("Hours", style: Theme.of(context).textTheme.bodyMedium),
        Text("Minutes", style: Theme.of(context).textTheme.bodyMedium),
        Text("Seconds", style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class Button_Row extends StatelessWidget {
  const Button_Row({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 80,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 1),
        myButton(onPressed: () {}, title: "Task", color: Colors.blueGrey),
        myButton(
          onPressed: () {},
          title: "Short Brake",
          color: Colors.blueAccent,
        ),
        myButton(
          onPressed: () {},
          title: "Long Break",
          color: Colors.redAccent,
        ),
        SizedBox(width: 30),
      ],
    );
  }
}
