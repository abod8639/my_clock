import 'package:flutter/material.dart';

PreferredSizeWidget myAppBar(controller) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(left: 80.0),
      child: Text('focus zone'),
    ),
    backgroundColor: Colors.black26,
    elevation: 0,

    actions: [
      MaterialButton(
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
      IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
      SizedBox(width: 30),
    ],
  );
}
