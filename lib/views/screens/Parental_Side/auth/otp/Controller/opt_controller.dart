import 'package:get/get.dart';

class OtpController extends GetxController {
  RxString otpCode = ''.obs;
  RxString otpError = ''.obs;
  RxBool isOtpInvalid = false.obs;

  validateFields() {
    if (otpCode.value.isEmpty) {
      otpError.value = "OTP is Required";
      isOtpInvalid.value = true;
    } else {
      otpError.value = "";
      isOtpInvalid.value = false;
    }
  }

  clearFields() {
    otpCode.value = '';
    otpError.value = '';
    isOtpInvalid.value = false;
  }
}
