import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_clock/controller/controller.Getx.dart';

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
  final Imagecontroller controller = Get.find<Imagecontroller>();

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: isHovered ? 1.2 : 1.0,
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
            width: MediaQuery.of(context).size.width * 0.15,
            //     (controller.isDesktop(context) ? 0.2 : 0.4),
            // controller.isDesktop(context) ? 200 : 100,
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.02,
                ),

                // controller.isDesktop(context)
                //     ? Theme.of(context).textTheme.bodyMedium
                //     : Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
