import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';
import 'package:supakids/views/services/auth_Services.dart';
import '../../../../custom_widgets/loading.dart';
import '../../../../models/user_model.dart';
import '../../../../services/storage.dart';
import '../../../../web_services/auth_service.dart';

class SignupController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

   AuthServices service = AuthServices();

  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxString confirmPasswordError = ''.obs;
  RxString nameError = ''.obs;
  RxBool isLoading = false.obs;


  @override
  void onClose() {
    clearFields();
    super.onClose();
  }


  void clearFields() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    nameController.clear();
    emailError.value = '';
    passwordError.value = '';
    confirmPasswordError.value = '';
    nameError.value = '';
  }

  Future<void> register(context) async {
      emailError.value = emailController.text.isEmpty ? kEmailReq : '';
      passwordError.value = passwordController.text.isEmpty ? kPassReq : '';
      confirmPasswordError.value = confirmPasswordController.text.isEmpty ? kConfirmPassReq : '';
      nameError.value = nameController.text.isEmpty ? kNameReq : '';

      if (emailError.isNotEmpty || passwordError.isNotEmpty || confirmPasswordError.isNotEmpty || emailError.isNotEmpty) {
        showToast(context, msg: kFieldsToast, duration: 2);
        return;
      }
      if (passwordController.text.length < 8) {
        passwordError.value = kPasswordAtLeast;
        return;
      }
      if (passwordController.text != confirmPasswordController.text) {
        confirmPasswordError.value = kPasswordNotMatch;
        return;
      }
    isLoading.value = true;
    try {
      var data = {
        "email": emailController.text.trim(),
        "name": nameController.text.trim(),
        "password": passwordController.text.trim(),
        "childProfiles": 0,
        "subscriptionPlan": "basic",
        "role": "user"
      };

      var response = await service.signup(data);
      log("Signup response================>>>>>>>: $response");
      if (response != null && response['message'] == "User registered successfully.") {
        var userSD = response['user'];
        String token = response['token'];

        await Storage.setToken(token);
        await Storage.setLogin(userSD);

        showToast(context, msg: kSignupSuccess, duration: 2);
        clearFields();
        Get.toNamed(kLogin);
      } else {
        showToast(context, msg: response?['message'] ?? "Signup failed", duration: 2);
      }
    } catch (e) {
      log("Signup error: $e");
    } finally {
      isLoading.value = false;
    }
  }


}
