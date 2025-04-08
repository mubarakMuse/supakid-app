import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';


class SettingsController extends GetxController {

  RxBool isSwitch = false.obs;

  switchToggle() {
    isSwitch.value = !isSwitch.value;
    if (isSwitch.value) {
      Get.toNamed(kParentalLock);
    }
  }

}
