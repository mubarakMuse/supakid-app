import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController userIdController = TextEditingController();

  RxString emailError = ''.obs;


  @override
  void onInit() {
    super.onInit();
    clearFields();
  }

  validateFields() {
    emailError.value = userIdController.text.isEmpty ? kUserIDReq : '';
  }
  clearFields() {
    userIdController.clear();
    emailError.value = '';
  }

}
