import 'package:get/get.dart';


class ChangeLanguageController extends GetxController {

  RxBool isSwitch1 = true.obs;
  RxBool isSwitch2 = false.obs;
  RxBool isSwitch3 = false.obs;

  switchToggle1() {
    isSwitch1.value = !isSwitch1.value;
  }
  switchToggle2() {
    isSwitch2.value = !isSwitch2.value;
  }

  switchToggle3() {
    isSwitch3.value = !isSwitch3.value;
  }

}
