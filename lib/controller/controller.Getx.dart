import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_clock/app/ImageList.dart';

class Imagecontroller extends GetxController {
  // is disktop or phone

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600.0;
  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600.0 &&
      MediaQuery.of(context).size.width < 1000.0;
  bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < 600.0;

  //---------------------------------------------------------------

  bool _isNextImageLocked = false;

  int delay = 2000;

  RxInt ImageIndex = 0.obs;

  //*this is image changer
  void changeImage() async {
    if (_isNextImageLocked) return;
    _isNextImageLocked = true;
    ImageIndex.value = (ImageIndex.value + 1) % ImageList.length;
    await Future.delayed(Duration(milliseconds: delay));
    _isNextImageLocked = false;
  }

  //----------------------------------------------------------------

  //* this is the clock
  RxString currentTime = ''.obs;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    final now = DateTime.now();
    final formatted =
        "${_twoDigits(now.hour)} : ${_twoDigits(now.minute)} : ${_twoDigits(now.second)} ";
    currentTime.value = formatted;
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  //----------------------------------------------------------------
}

class TimerController extends GetxController {
  final RxInt totalSeconds = 300.obs;
  final RxInt remainingSeconds = 300.obs;
  final RxBool isRunning = false.obs;
  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        stopTimer();
      }
    });
    isRunning.value = true;
  }

  void stopTimer() {
    _timer?.cancel();
    isRunning.value = false;
  }

  void toggleTimer() {
    if (isRunning.value) {
      stopTimer();
    } else {
      if (remainingSeconds.value > 0) {
        startTimer();
      }
    }
  }

  void updateTimer(int minutes) {
    if (minutes > 0) {
      totalSeconds.value = minutes * 60;
      remainingSeconds.value = totalSeconds.value;
      isRunning.value = false;
    }
  }

  String formatTime(int seconds) {
    int m = seconds ~/ 60;
    int s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
