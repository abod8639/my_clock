import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_clock/controller/controller.Getx.dart';

class TimerPage extends StatelessWidget {
  TimerPage({super.key});

  final TimerController controller = Get.put(TimerController());

  void editTimer(BuildContext context) async {
    controller.stopTimer();

    int newMinutes = controller.totalSeconds.value ~/ 60;
    final result = await showDialog<int>(
      context: context,
      builder: (context) {
        TextEditingController textController = TextEditingController(
          text: newMinutes.toString(),
        );

        return Dialog(
          backgroundColor: const Color.fromARGB(179, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * .1,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Set Timer",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .1 * .5,
                  child: TextField(
                    controller: textController,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      labelText: "Minutes",
                      labelStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    int? parsedValue = int.tryParse(textController.text);
                    Navigator.pop(context, parsedValue);
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (result != null && result > 0) {
      controller.updateTimer(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: controller.toggleTimer,
                    onDoubleTap: () => editTimer(context),
                    child: Text(
                      controller.formatTime(controller.remainingSeconds.value),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // IconButton(
                //   icon: const Icon(Icons.edit, color: Colors.white),
                //   onPressed: () => editTimer(context),
                //   iconSize: 25,
                // ),
              ],
            ),
            // Obx(
            //   () => IconButton(
            //     iconSize: 40,
            //     icon: Icon(
            //       controller.isRunning.value ? Icons.pause : Icons.play_arrow,
            //     ),
            //     onPressed: controller.toggleTimer,
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
