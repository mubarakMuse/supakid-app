import 'package:get/get.dart';
import 'package:supakids/utils/screen_bindings.dart';
import 'package:supakids/views/screens/Parental_Side/Home/home.dart';
import 'package:supakids/views/screens/Parental_Side/auth/forgot_Password/forgotPassword_screen.dart';
import 'package:supakids/views/screens/Parental_Side/auth/otp/otp_screen.dart';
import 'package:supakids/views/screens/Parental_Side/auth/reset_Password/resetPassword_screen.dart';
import 'package:supakids/views/screens/Parental_Side/auth/set_new_Password/set_Password.dart';
import 'package:supakids/views/screens/Parental_Side/auth/signup/signup_screen.dart';
import 'package:supakids/views/screens/Parental_Side/auth/signup/signup_success.dart';
import 'package:supakids/views/screens/Parental_Side/home/Settings/change_language/change_language.dart';
import 'package:supakids/views/screens/Parental_Side/home/Settings/change_password/change_password.dart';
import 'package:supakids/views/screens/Parental_Side/home/Settings/settings.dart';
import 'package:supakids/views/screens/Parental_Side/home/active_history/active_history.dart';
import 'package:supakids/views/screens/Parental_Side/home/youtube_playlist/add_new_channel/add_new_channel.dart';
import 'package:supakids/views/screens/Parental_Side/home/child_Profile/add_profile/add_profile.dart';
import 'package:supakids/views/screens/Parental_Side/home/child_Profile/all_profiles/all_profiles.dart';
import 'package:supakids/views/screens/Parental_Side/home/child_Profile/edit_profile/edit_profile.dart';
import 'package:supakids/views/screens/Parental_Side/home/content_preference/content_prefernce.dart';
import 'package:supakids/views/screens/Parental_Side/home/notifications/notification.dart';
import 'package:supakids/views/screens/Parental_Side/home/screen_time/screen_time.dart';
import 'package:supakids/views/screens/Parental_Side/home/subscription_payment/subscrption_payment.dart';
import 'package:supakids/views/screens/Parental_Side/home/youtube_playlist/youtube_playlist.dart';
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
      GetPage(name: kSignupSuccessful, page: () =>  const SignupSuccessScreen(), ),
      GetPage(name: kHome, page: () =>  const HomeScreen(), binding: ScreenBindings()),
      GetPage(name: kChildPro, page: () =>  const AllProfilesScreen(), binding: ScreenBindings()),
      GetPage(name: kEditPro, page: () =>  const EditProfilesScreen(), binding: ScreenBindings()),
      GetPage(name: kAddPro, page: () =>  const AddProfileScreen(), binding: ScreenBindings()),
      GetPage(name: kContentPrefer, page: () =>  const ContentPreferenceScreen(), binding: ScreenBindings()),
      GetPage(name: kScreenTime, page: () =>  const ScreenTime(), binding: ScreenBindings()),
      GetPage(name: kYoutubePlaylist, page: () =>  const YoutubePlaylistScreen(), binding: ScreenBindings()),
      GetPage(name: kAddNewChannel, page: () =>  const AddNewChannelScreen(), binding: ScreenBindings()),
      GetPage(name: kActiveHistory, page: () =>  const ActiveHistoryScreen(), binding: ScreenBindings()),
      GetPage(name: kNotification, page: () =>  const NotificationScreen(), binding: ScreenBindings()),
      GetPage(name: kSubscriptionPayment, page: () =>  const SubscriptionPaymentScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingPage, page: () =>  const SettingsScreen(), binding: ScreenBindings()),
      GetPage(name: kChangePassword, page: () =>  const ChangePasswordScreen(), binding: ScreenBindings()),
      GetPage(name: kChangeLanguage, page: () =>  const ChangeLanguageScreen(), binding: ScreenBindings()),





    ];
  }
}
