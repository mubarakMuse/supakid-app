import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  RxBool isExpanded = false.obs;
  RxBool isSwitch1 = false.obs;
  RxBool isSwitch2 = false.obs;

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
