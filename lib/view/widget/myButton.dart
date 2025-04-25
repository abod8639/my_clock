import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final void Function() onPressed;
  final String title;
  final Color color;

  const MyButton({
    super.key,
    required this.title,
    required this.color,
    required this.onPressed,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: isHovered ? 1.3 : 1.0,
        child: MaterialButton(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 200),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          mouseCursor: SystemMouseCursors.click,
          elevation: isHovered ? 6 : 3,
          color: widget.color.withOpacity(0.8),
          onPressed: widget.onPressed,
          child: SizedBox(
            width: 100,
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
