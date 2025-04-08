import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';
import '../../../../custom_widgets/loading.dart';
import '../../../../web_services/auth_service.dart';

class SetPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxString passwordError = ''.obs;
  RxString confirmPasswordError = ''.obs;
  RxBool isLoading = false.obs;

  late String email;
  final routeSerivce _service = routeSerivce();

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments?["email"] ?? "";
  }

  Future<void> setNewPassword(context) async {
    passwordError.value = passwordController.text.isEmpty ? kEnterNewPass : "";
    confirmPasswordError.value = confirmPasswordController.text.isEmpty ? kEnterConfirmPass : "";
    if (passwordError.isNotEmpty || confirmPasswordError.isNotEmpty) {
      showToast(context, msg: kFieldsToast, duration: 2);
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      confirmPasswordError.value = kPasswordNotMatch;
      return;
    }

    isLoading.value = true;
    var result = await _service.resetPassword(
      email: email,
      newPassword: passwordController.text,
    );
    isLoading.value = false;
    log("Password Reset API Response: '$result'");
    if (result == "Password reset successful.") {
      showToast(context, msg: "Password Updated!", duration: 2);
      Get.offNamed(kPasswordSuccessful);
    } else {
      showToast(context, msg: kSomeThingWrong, duration: 2);
    }
  }




}
