import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_clock/app/theme.dart';
import 'package:my_clock/view/page/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darktheme,
      home: const MyHomePage(),
    );
  }
} // This is the theme of your application.
