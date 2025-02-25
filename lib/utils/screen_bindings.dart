import 'package:get/get.dart';
import 'package:supakids/views/screens/auth/forgot_Password/Controller/forgotPassword_controller.dart';
import 'package:supakids/views/screens/auth/login/controller/login_controller.dart';
import 'package:supakids/views/screens/auth/otp/Controller/opt_controller.dart';
import 'package:supakids/views/screens/auth/signup/controller/signup_controller.dart';
import 'package:supakids/views/screens/initial/onBoard/onBoard_controller.dart';

import '../views/screens/initial/splash/controller/splash_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => OnBoardingController());
    Get.lazyPut(() => LoginController() );
    Get.lazyPut(() => SignupController() );
    Get.lazyPut(() => ForgotPasswordController() );
    Get.lazyPut(() => OtpController() );



  }
}
