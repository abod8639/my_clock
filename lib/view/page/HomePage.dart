import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:my_clock/app/ImageList.dart';
import 'package:my_clock/controller/controller.Getx.dart';
import 'package:my_clock/view/widget/myAppBar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(imagecontroller());
    return Obx(
      () => AnimatedContainer(
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageList[controller.ImageIndex.value]),
            fit: BoxFit.cover,
          ),
          color: Colors.transparent,
          // borderRadius: BorderRadius.circular(20),
        ),
        duration: Duration(milliseconds: controller.delay),

        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: myAppBar(controller),

          body: Expanded(
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      spacing: 80,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 1),
                        myButton(
                          onPressed: controller.changeImage,
                          title: "Task",
                          color: Colors.blueGrey,
                        ),
                        myButton(
                          onPressed: controller.changeImage,
                          title: "Sport Brake",
                          color: Colors.blueAccent,
                        ),
                        myButton(
                          onPressed: controller.changeImage,
                          title: "Long Break",
                          color: Colors.redAccent,
                        ),
                        SizedBox(width: 30),
                      ],
                    ),

                    // SizedBox(height: 20),
                    Text(
                      controller.currentTime.value,
                      style: TextStyle(
                        color: Colors.white,
                        shadows: List.filled(
                          1,
                          BoxShadow(color: Colors.black, offset: Offset(1, 1)),
                        ),
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ).asGlass(
              // tintColor: Colors.white10,
              frosted: false,
              enabled: true,

              // tintColor: Colors.white10,
              blurY: 2,
              blurX: 2,
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
    );
  }
}

class myButton extends StatelessWidget {
  final void Function() onPressed;

  final String title; //t
  final Color color;

  const myButton({
    super.key,
    required this.title,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // minWidth: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      mouseCursor: SystemMouseCursors.click,
      elevation: 3,
      clipBehavior: Clip.none,
      color: color.withAlpha(200),
      onPressed: onPressed,
      child: SizedBox(width: 100, child: Center(child: Text(title))),
    );
  }
}
