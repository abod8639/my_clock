import 'package:flutter/material.dart';

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
