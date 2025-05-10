import 'package:flutter/material.dart';

import 'package:my_clock/view/widget/myButton.dart';

class Button_Row extends StatelessWidget {
  const Button_Row({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // spacing: controller.isDesktop(context) ? 50 : 10,
      spacing: MediaQuery.of(context).size.width * 0.02,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // SizedBox(width: 1),
        MyButton(onPressed: () {}, title: "Task", color: Colors.blueGrey),
        MyButton(
          onPressed: () {},
          title: "Short Brake",
          color: Colors.blueAccent,
        ),
        MyButton(
          onPressed: () {},
          title: "Long Break",
          color: Colors.redAccent,
        ),
        // SizedBox(width: 30),
      ],
    );
  }
}
