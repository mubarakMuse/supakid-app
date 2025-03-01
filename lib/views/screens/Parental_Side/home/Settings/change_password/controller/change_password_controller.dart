import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../../utils/app_strings.dart';


class ChangePasswordController extends GetxController {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  RxString currentPassError = ''.obs;
  RxString newPassError = ''.obs;
  RxString confirmPassError = ''.obs;

  validateFields() {
    currentPassError.value = currentPasswordController.text.trim().isEmpty ? kCurrentPassReq: '';
    newPassError.value = newPasswordController.text.trim().isEmpty ? kNewPassReq: '';
    confirmPassError.value = confirmPasswordController.text.trim().isEmpty ? kConfirmPassReq: '';
  }



}
