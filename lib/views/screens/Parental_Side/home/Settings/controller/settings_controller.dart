import 'package:get/get.dart';


class SettingsController extends GetxController {

  RxBool isSwitch = true.obs;

  switchToggle() {
    isSwitch.value = !isSwitch.value;
  }

}
