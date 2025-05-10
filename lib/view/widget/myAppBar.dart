import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_clock/view/page/SettingPage.dart';

PreferredSizeWidget myAppBar(controller) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(left: 80.0),
      child: Text(
        style: TextStyle(
          decorationColor: Colors.white,
          shadows: List.filled(
            1,
            BoxShadow(color: Colors.black, offset: Offset(1, 1)),
            growable: true,
          ),
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 30,
        ),
        'focus zone',
      ),
    ),
    backgroundColor: Colors.black26,
    elevation: 0,

    actions: [
      MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        elevation: 3,
        color: Colors.white10,
        onPressed: controller.changeImage,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.imagesearch_roller_rounded),
              SizedBox(width: 5),
              Text("Change BackGround"),
            ],
          ),
        ),
      ),
      SizedBox(width: 30),
      IconButton(
        onPressed: () {
          Get.to(() => SettingsPage());
        },
        icon: Icon(Icons.settings),
      ),
      SizedBox(width: 30),
    ],
  );
}
