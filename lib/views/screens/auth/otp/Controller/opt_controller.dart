import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supakids/views/custom_widgets/loading.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../web_services/auth_service.dart';

class OtpController extends GetxController {
  RxString otpCode = ''.obs;
  RxString otpError = ''.obs;
  RxBool isOtpInvalid = false.obs;
  RxBool isLoading = false.obs;
  RxInt countdown = 0.obs;
  RxBool isResendDisabled = false.obs;
  late String email;
  final routeSerivce _service = routeSerivce();
  void startCountdown() {
    countdown.value = 59;
    isResendDisabled.value = true;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 1) {
        countdown.value--;
      } else {
        timer.cancel();
        isResendDisabled.value = false;
      }
    });
  }
  @override
  void onInit() {
    super.onInit();
    email = Get.arguments?["email"] ?? "";
  }


  validateFields() {
    if (otpCode.value.isEmpty) {
      otpError.value = "OTP is Required";
      isOtpInvalid.value = true;
    } else {
      otpError.value = "";
      isOtpInvalid.value = false;
    }
  }

  void resendOtp( context) async {
    if (isResendDisabled.value) return;
    isLoading.value = true;
    var result = await _service.resendOTP(email: email);
    isLoading.value = false;
    if (result == "OTP resent to email.") {
      showToast(context, msg: kANewOTP, duration: 2);
      startCountdown();
    } else if (result == "Please wait before requesting a new OTP.") {
      showToast(context, msg: kWaitAMint, duration: 2);
    } else {
      showToast(context, msg: kSomeThingWrong, duration: 2);
    }
  }


  void verifyOTP(context) async {
    if (otpCode.value.length < 5) {
      isOtpInvalid.value = true;
      showToast(context, msg: kPleaseEnterValid, duration: 2);
      return;
    }
    isLoading.value = true;
    var result = await _service.verifyOTP(email: email, otp: otpCode.value);
    isLoading.value = false;
    if (result == "OTP verified successfully.") {
      showToast(context, msg: kVerifySuccess, duration: 2);
      Get.toNamed(kResetPass, arguments: {"email": email} );
    } else if (result == "Invalid OTP.") {
      isOtpInvalid.value = true;
      showToast(context, msg: kInvalidOTPAgain, duration: 2);
    } else if (result == "OTP expired.") {
      isOtpInvalid.value = true;
      showToast(context, msg: kOTPExpired, duration: 2);
    } else {
      showToast(context, msg: kSomeThingWrong, duration: 2);
    }
  }



}
