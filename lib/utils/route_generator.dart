import 'package:get/get.dart';
import 'package:supakids/utils/screen_bindings.dart';
import 'package:supakids/views/screens/auth/forgot_Password/forgotPassword_screen.dart';
import 'package:supakids/views/screens/auth/otp/otp_screen.dart';
import 'package:supakids/views/screens/auth/signup/signup_screen.dart';
import '../views/screens/auth/login/login_screen.dart';
import '../views/screens/initial/onBoard/onBoard_screen.dart';
import '../views/screens/initial/splash/splash_screen.dart';
import 'app_strings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(name: kSplashRoute, page: () => const SplashScreen(), binding: ScreenBindings()),
      GetPage(name: kOnBoarding, page: () => const OnBoarding(), binding: ScreenBindings()),
      GetPage(name: kLogin, page: () =>  const LoginScreen(), binding: ScreenBindings()),
      GetPage(name: kSignup, page: () =>  const SignupScreen(), binding: ScreenBindings()),
      GetPage(name: kForgotPassword, page: () =>  const ForgotPasswordScreen(), binding: ScreenBindings()),
      GetPage(name: kOtp, page: () =>  const OtpScreen(), binding: ScreenBindings()),


    ];
  }
}
