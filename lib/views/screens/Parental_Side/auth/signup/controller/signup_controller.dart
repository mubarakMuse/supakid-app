import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';

class SignupController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxString confirmPasswordError = ''.obs;

  void validateFields() {
    emailError.value = emailController.text.isEmpty ? kEmailReq : '';
    passwordError.value = passwordController.text.isEmpty ? kPassReq : '';
    confirmPasswordError.value = confirmPasswordController.text.isEmpty ? kConfirmPassReq : '';
  }

}
