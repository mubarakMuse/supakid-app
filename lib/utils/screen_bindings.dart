import 'package:get/get.dart';
import 'package:supakids/views/screens/Parental_Side/Home/controller/home_controller.dart';
import 'package:supakids/views/screens/Parental_Side/auth/forgot_Password/Controller/forgotPassword_controller.dart';
import 'package:supakids/views/screens/Parental_Side/auth/login/controller/login_controller.dart';
import 'package:supakids/views/screens/Parental_Side/auth/otp/Controller/opt_controller.dart';
import 'package:supakids/views/screens/Parental_Side/auth/signup/controller/signup_controller.dart';
import 'package:supakids/views/screens/Parental_Side/home/Settings/change_language/controller/change_language_controller.dart';
import 'package:supakids/views/screens/Parental_Side/home/Settings/change_password/controller/change_password_controller.dart';
import 'package:supakids/views/screens/Parental_Side/home/Settings/controller/settings_controller.dart';
import 'package:supakids/views/screens/Parental_Side/home/active_history/controller/active_history_controller.dart';
import 'package:supakids/views/screens/Parental_Side/home/youtube_playlist/add_new_channel/controller/add_new_channel_controller.dart';
import 'package:supakids/views/screens/Parental_Side/home/child_Profile/add_profile/controller/add_profile_controller.dart';
import 'package:supakids/views/screens/Parental_Side/home/child_Profile/all_profiles/controller/all_profiles_controller.dart';
import 'package:supakids/views/screens/Parental_Side/home/child_Profile/edit_profile/controller/child_profiles_controller.dart';
import 'package:supakids/views/screens/Parental_Side/home/content_preference/controller/content_preference_controller.dart';
import 'package:supakids/views/screens/Parental_Side/home/notifications/controller/notification_controller.dart';
import 'package:supakids/views/screens/Parental_Side/home/screen_time/controller/screen_time_controller.dart';
import 'package:supakids/views/screens/Parental_Side/home/subscription_payment/controller/subscription_payment_controller.dart';
import 'package:supakids/views/screens/Parental_Side/home/youtube_playlist/controller/youtube_playlist_controller.dart';
import 'package:supakids/views/screens/Parental_Side/initial/onBoard/controller/onBoard_controller.dart';
import '../views/screens/Parental_Side/auth/set_new_Password/controller/set_password_controller.dart';
import '../views/screens/Parental_Side/initial/splash/controller/splash_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => OnBoardingController());
    Get.lazyPut(() => LoginController() );
    Get.lazyPut(() => SignupController() );
    Get.lazyPut(() => ForgotPasswordController() );
    Get.lazyPut(() => OtpController() );
    Get.lazyPut(() => SetPasswordController() );
    Get.lazyPut(() => HomeController() );
    Get.lazyPut(() => AllProfilesController() );
    Get.lazyPut(() => EditProfileController() );
    Get.lazyPut(() => AddProfileController() );
    Get.lazyPut(() => ContentPreferenceController() );
    Get.lazyPut(() => ScreenTimeController() );
    Get.lazyPut(() => YoutubePlaylistController() );
    Get.lazyPut(() => AddNewChannelController() );
    Get.lazyPut(() => ActiveHistoryController() );
    Get.lazyPut(() => NotificationController() );
    Get.lazyPut(() => SubscriptionPaymentController() );
    Get.lazyPut(() => SettingsController() );
    Get.lazyPut(() => ChangePasswordController() );
    Get.lazyPut(() => ChangeLanguageController() );



  }
}
