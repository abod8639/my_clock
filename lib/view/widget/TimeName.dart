import 'package:flutter/material.dart';
import 'package:my_clock/controller/controller.Getx.dart';

final Imagecontroller controller = Imagecontroller();

class TimeName extends StatelessWidget {
  const TimeName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: MediaQuery.of(context).size.width * 0.075,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <text>[
        text(time: "Task"),
        text(time: "Minutes"),
        text(time: "Seconds"),
      ],
    );
  }
}

class text extends StatelessWidget {
  final String time;
  const text({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      style: TextStyle(
        shadows: List.filled(
          1,
          BoxShadow(color: Colors.black, offset: Offset(1, 1)),
        ),
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.width * 0.04,
      ),
    );
  }
}
