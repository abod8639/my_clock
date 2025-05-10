import 'package:flutter/material.dart';
import 'package:my_clock/controller/controller.Getx.dart';

class GetTime extends StatelessWidget {
  final Imagecontroller controller;
  const GetTime({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Text(
      controller.currentTime.value,
      style: TextStyle(
        shadows: List.filled(
          1,
          BoxShadow(color: Colors.black, offset: Offset(1, 1)),
        ),
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.width * 0.11,
      ),
      // controller.isDesktop(context)
      //     ? Theme.of(context).textTheme.bodyLarge
      //     : Theme.of(context).textTheme.bodyMedium,
    );
  }
}
