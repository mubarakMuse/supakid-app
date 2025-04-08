import 'package:get/get.dart';
import 'package:supakids/utils/screen_bindings.dart';
import 'package:supakids/views/custom_widgets/navigations_bar/admin_navbar/admin_navbar_bar.dart';
import 'package:supakids/views/custom_widgets/navigations_bar/child_navbar/child_navbar_bar.dart';
import 'package:supakids/views/screens/Parental_Side/Home/parental_home.dart';
import 'package:supakids/views/screens/admin_side/manage_content/add_video/add_video.dart';
import 'package:supakids/views/screens/admin_side/manage_content/edit_video/edit_video.dart';
import 'package:supakids/views/screens/admin_side/users/edit_parent_profile/edit_parent_profile.dart';
import 'package:supakids/views/screens/kid_side/category/category.dart';
import 'package:supakids/views/screens/kid_side/downloads/downloads.dart';
import 'package:supakids/views/screens/kid_side/favourite/favourite.dart';
import 'package:supakids/views/screens/kid_side/profile/profile.dart';
import 'package:supakids/views/screens/kid_side/video_play/video_play.dart';
import 'package:supakids/views/screens/parental_side/child_Profile/all_child_profiles/all_child_profiles.dart';
import 'package:supakids/views/screens/parental_side/screen_time/set_screen_time/set_screen_time.dart';
import '../views/screens/auth/forgot_Password/forgotPassword_screen.dart';
import '../views/screens/auth/login/login_screen.dart';
import '../views/screens/auth/otp/otp_screen.dart';
import '../views/screens/auth/reset_Password/resetPassword_screen.dart';
import '../views/screens/auth/set_new_Password/set_Password.dart';
import '../views/screens/auth/signup/signup_screen.dart';
import '../views/screens/auth/set_new_Password/password_success.dart';
import '../views/screens/initial/all_profiles/all_profiles.dart';
import '../views/screens/initial/onBoard/onBoard_screen.dart';
import '../views/screens/initial/splash/splash_screen.dart';
import '../views/screens/kid_side/home/kid_home.dart';
import '../views/screens/parental_side/active_history/active_history.dart';
import '../views/screens/parental_side/child_Profile/add_profile/add_profile.dart';
import '../views/screens/parental_side/child_Profile/edit_profile/edit_profile.dart';
import '../views/screens/parental_side/content_preference/content_prefernce.dart';
import '../views/screens/parental_side/content_preference/set_content/set_content.dart';
import '../views/screens/parental_side/notifications/notification.dart';
import '../views/screens/parental_side/screen_time/screen_time.dart';
import '../views/screens/parental_side/settings/change_language/change_language.dart';
import '../views/screens/parental_side/settings/change_password/change_password.dart';
import '../views/screens/parental_side/settings/customer_support/customer_support.dart';
import '../views/screens/parental_side/settings/parental_lock/parental_lock.dart';
import '../views/screens/parental_side/settings/settings.dart';
import '../views/screens/parental_side/subscription_payment/subscrption_payment.dart';
import '../views/screens/parental_side/youtube_playlist/add_new_channel/add_new_channel.dart';
import '../views/screens/parental_side/youtube_playlist/youtube_playlist.dart';
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
      GetPage(name: kPasswordSuccessful, page: () =>  const PasswordSuccessScreen(), ),
      GetPage(name: kHome, page: () =>  const ParentalHomeScreen(), binding: ScreenBindings()),
      GetPage(name: kChildPro, page: () =>  const AllChildProfilesScreen(), binding: ScreenBindings()),
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
      GetPage(name: kParentalLock, page: () =>  const ParentalLockScreen(), binding: ScreenBindings()),
      GetPage(name: kCustomerSupport, page: () =>  const CustomerSupport(),),
      GetPage(name: kAllProfiles, page: () =>  const AllProfiles (),),
      GetPage(name: kKidsHome, page: () =>  const KidHomeScreen(), binding: ScreenBindings()),
      GetPage(name: kCategories, page: () =>  const CategoryScreen(), binding: ScreenBindings()),
      GetPage(name: kVideoPlay, page: () =>  const VideoPlayScreen(), binding: ScreenBindings()),
      GetPage(name: kFavourites, page: () =>  const FavouriteScreen(), binding: ScreenBindings()),
      GetPage(name: kDownloads, page: () =>  const DownloadsScreen(), binding: ScreenBindings()),
      GetPage(name: kProfilePage, page: () =>  const ProfileScreen(), binding: ScreenBindings()),
      GetPage(name: kChildNavBar, page: () =>   ChildNavBar(), binding: ScreenBindings()),
      GetPage(name: kAdminNavBar, page: () =>   AdminNavBar(), binding: ScreenBindings()),
      GetPage(name: kContentSet, page: () =>  const SetContentScreen(), binding: ScreenBindings()),
      GetPage(name: kEditParentProfile, page: () =>  const  EditParentProfile(), binding: ScreenBindings()),
      GetPage(name: kAddVideo, page: () =>  const  AddVideoScreen(), binding: ScreenBindings()),
      GetPage(name: kSubscriptionManagement, page: () =>  const  SubscriptionPaymentScreen(), binding: ScreenBindings()),
      GetPage(name: kEditVideo, page: () =>  const  EditVideoScreen(), binding: ScreenBindings()),
      GetPage(name: kSetScreenTime, page: () =>  const  SetScreenTime(),binding: ScreenBindings()),






    ];
  }
}
