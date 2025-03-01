import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';

import '../../../../../custom_widgets/loading.dart';

class SignupController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxString confirmPasswordError = ''.obs;
  RxBool isLoading = false.obs;

   validateFields() {
    emailError.value = emailController.text.isEmpty ? kEmailReq : '';
    passwordError.value = passwordController.text.isEmpty ? kPassReq : '';
    confirmPasswordError.value = confirmPasswordController.text.isEmpty ? kConfirmPassReq : '';
  }
  signUp(BuildContext context) async {
    validateFields();
    if (emailError.isNotEmpty || passwordError.isNotEmpty || confirmPasswordError.isNotEmpty) {
      showToast(context, msg: kFieldsToast, duration: 2);
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.toNamed(kHome);
    showToast(context, msg: kSignupSuccess, duration: 2);
  }

}
