import 'dart:async';

import 'package:get/get.dart';
import 'package:my_clock/app/ImageList.dart';

class imagecontroller extends GetxController {
  bool _isNextImageLocked = false;

  int delay = 1500;

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
  //*this is the clock
  RxString currentTime = ''.obs;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _updateTime(); // مبدئيًا
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
}
