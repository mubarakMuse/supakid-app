import 'package:get/get.dart';
import 'package:supakids/utils/screen_bindings.dart';
import 'package:supakids/views/screens/Parental_Side/Home/home.dart';
import 'package:supakids/views/screens/Parental_Side/auth/forgot_Password/forgotPassword_screen.dart';
import 'package:supakids/views/screens/Parental_Side/auth/otp/otp_screen.dart';
import 'package:supakids/views/screens/Parental_Side/auth/reset_Password/resetPassword_screen.dart';
import 'package:supakids/views/screens/Parental_Side/auth/set_new_Password/set_Password.dart';
import 'package:supakids/views/screens/Parental_Side/auth/signup/signup_screen.dart';
import 'package:supakids/views/screens/Parental_Side/auth/signup/signup_success.dart';
import 'package:supakids/views/screens/Parental_Side/home/child_Profile/add_profile/add_profile.dart';
import 'package:supakids/views/screens/Parental_Side/home/child_Profile/all_profiles/all_profiles.dart';
import 'package:supakids/views/screens/Parental_Side/home/child_Profile/edit_profile/edit_profile.dart';
import 'package:supakids/views/screens/Parental_Side/home/content_preference/content_prefernce.dart';
import '../views/screens/Parental_Side/auth/login/login_screen.dart';
import '../views/screens/Parental_Side/initial/onBoard/onBoard_screen.dart';
import '../views/screens/Parental_Side/initial/splash/splash_screen.dart';
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
      GetPage(name: kResetPass, page: () =>  const ResetPasswordScreen(), ),
      GetPage(name: kSetNewPass, page: () =>  const NewPasswordScreen(), binding: ScreenBindings()),
      GetPage(name: kSignupSuccess, page: () =>  const SignupSuccessScreen(), ),
      GetPage(name: kHome, page: () =>  const HomeScreen(), binding: ScreenBindings()),
      GetPage(name: kChildPro, page: () =>  const AllProfilesScreen(), binding: ScreenBindings()),
      GetPage(name: kEditPro, page: () =>  const EditProfilesScreen(), binding: ScreenBindings()),
      GetPage(name: kAddPro, page: () =>  const AddProfileScreen(), binding: ScreenBindings()),
      GetPage(name: kContentPrefer, page: () =>  const ContentPreferenceScreen(), binding: ScreenBindings()),





    ];
  }
}
