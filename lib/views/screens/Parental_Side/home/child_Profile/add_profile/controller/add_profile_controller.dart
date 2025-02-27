import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class AddProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  RxBool isExpanded = false.obs;
  RxString nameError = ''.obs;
  RxString ageError = ''.obs;

  validateFields() {
    nameError.value = nameController.text.trim().isEmpty ? 'Name is Required' : '';
    ageError.value = ageController.text.trim().isEmpty ? 'Age is Required' : '';
  }

  toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }


}
