class WebUrls extends _BaseUrl {
  WebUrls._();

  static const String kSignUpUrl = "${_BaseUrl._kBaseUrl}/api/auth/signup";
  static const String kSignInUrl = "${_BaseUrl._kBaseUrl}/api/auth/login";
  static const String kForgotPassUrl = "${_BaseUrl._kBaseUrl}/api/auth/forgotPass";
  static const String kResendOtpUrl = "${_BaseUrl._kBaseUrl}/api/auth/resendOTP";
  static const String kVerifyOtpUrl = "${_BaseUrl._kBaseUrl}/api/auth/verifyOtp";
  static const String kResetPassUrl = "${_BaseUrl._kBaseUrl}/api/auth/resetPass";
  static const String kCreateChildProfileUrl = "${_BaseUrl._kBaseUrl}/api/createChildProfile";
  static const String kGetChildProfileUrl = "${_BaseUrl._kBaseUrl}/api/getChildProfiles";
  static const String kGetUserWithChildUrl = "${_BaseUrl._kBaseUrl}/api/userWithChild";

}

abstract class _BaseUrl {
    static const String _kBaseUrl = 'http://192.168.10.4:3000';
}
