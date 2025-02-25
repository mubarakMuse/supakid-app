import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;


  @override
  void onInit() {
    super.onInit();
    clearFields();
  }

   validateFields() {
    emailError.value = emailController.text.isEmpty ? kEmailReq : '';
    passwordError.value = passwordController.text.isEmpty ? kPassReq : '';
  }
   clearFields() {
    emailController.clear();
    passwordController.clear();
    emailError.value = '';
    passwordError.value = '';
  }

}
