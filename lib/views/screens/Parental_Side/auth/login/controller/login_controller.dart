import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';

import '../../../../../custom_widgets/loading.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxBool isLoading = false.obs;


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
  login(BuildContext context) async {
    validateFields();
    if (emailError.isNotEmpty || passwordError.isNotEmpty) {
      showToast(context, msg: kFieldsToast, duration: 2);
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.toNamed(kHome);
    showToast(context, msg: kLoginSuccess, duration: 2);
  }


}
