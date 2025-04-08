import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';
import '../../../../../utils/helpers/global.dart';
import '../../../../custom_widgets/loading.dart';
import '../../../../services/auth_Services.dart';
import '../../../../services/storage.dart';


class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxBool isLoading = false.obs;
  AuthServices service = AuthServices();

  @override
  void onInit() {
    super.onInit();
    clearFields();
  }

  @override
  void onClose() {
    clearFields();
    super.onClose();
  }

   clearFields() {
    emailController.clear();
    passwordController.clear();
    emailError.value = '';
    passwordError.value = '';
  }


  Future<void> login(context) async {
    emailError.value = emailController.text.isEmpty ? kEmailReq : '';
    passwordError.value = passwordController.text.isEmpty ? kPassReq : '';

    if (emailError.isNotEmpty || passwordError.isNotEmpty) {
      showToast(context, msg: kFieldsToast, duration: 2);
      return;
    }

    isLoading.value = true;
    try {
      var data = {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };

      var response = await service.login(data);
      log("Login response================>>>>>>>: $response");
      if (response != null && response['message'] == "User login successful."
          || response['message'] == "Admin login successful.") {

        userSD = response['user'];
        String token = response['token'];

        await Storage.setToken(token);
        await Storage.setLogin(userSD);

        // log('UserSD is here==========>$userSD');

        if (userSD['role'] == "admin") {
          Get.toNamed(kAdminNavBar);
          showToast(context, msg: kLoginSuccess, duration: 2);
          clearFields();
        } else {
          Get.toNamed(kAllProfiles);
          showToast(context, msg: kLoginSuccess, duration: 2);
          clearFields();
        }
      } else {
        showToast(context, msg: response?['message'] ?? "Login failed", duration: 2);
      }
    } catch (e) {
      log("Login error: $e");
    } finally {
      isLoading.value = false;
    }
  }


  }



