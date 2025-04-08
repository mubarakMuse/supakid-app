import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/loading.dart';
import '../../../../web_services/auth_service.dart';

class ForgotController extends GetxController{
  TextEditingController emailController = TextEditingController();
  final routeSerivce _service = routeSerivce();


  RxString emailError = ''.obs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    clearFields();
  }

  validateFields() {
    emailError.value = emailController.text.isEmpty ? kUserIDReq : '';
  }
  clearFields() {
    emailController.clear();
    emailError.value = '';
  }
  forgetPassword(context) async {
    validateFields();

    if (emailError.isNotEmpty) {
      showToast(context, msg: kFieldsToast, duration: 2);
      return;
    }
    isLoading.value = true;
    var result = await _service.forgotPasswordUser(emailController.text);
    isLoading.value = false;

    if (result == "OTP sent to email.") {
      showToast(context, msg: "OTP sent successfully!", duration: 2);
      Get.toNamed(kOtp, arguments: {"email": emailController.text});
    } else {
      showToast(context, msg: result, duration: 2);
    }
  }

}