import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class ContentPreferenceController extends GetxController {


  RxInt hours = 1.obs;
  RxBool isSwitch1 = true.obs;
  RxBool isSwitch2 = false.obs;

  void incrementHour() {
    if (hours.value < 24) {
      hours.value++;
    }
  }

  void decrementHour() {
    if (hours.value > 1) {
      hours.value--;
    }
  }
  RxBool isExpanded = false.obs;
  toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }
  switchToggle1() {
    isSwitch1.value = !isSwitch1.value;
  }
  switchToggle2() {
    isSwitch2.value = !isSwitch2.value;
  }


}
