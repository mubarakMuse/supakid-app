import 'dart:convert';
import 'dart:developer';
import 'package:supakids/views/web_services/web_urls.dart';

import '../../utils/sessions/session_management.dart';
import '../../utils/sessions/session_token_keys.dart';
import '../models/response_model.dart';
import '../models/user_model.dart';
import 'http_request_client.dart';


class routeSerivce {
  routeSerivce._();

  static final routeSerivce _instance = routeSerivce._();

  factory routeSerivce() {
    return _instance;
  }

  final HTTPRequestClient _client = HTTPRequestClient();
  final SessionManagement _sessionManagement = SessionManagement();

  Future<dynamic> signUpUser({required UserModel userModel}) async {
    ResponseModel responseModel = await _client.customRequest(
      'POST',
      url: WebUrls.kSignUpUrl,
      requestBody: userModel.toJson(),
      requestHeader: {
        'Content-Type': 'application/json',
      },
    );
    log("signUpUser==================> $responseModel");
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      await _sessionManagement.saveSession(
        tokenKey: SessionTokenKeys.kUserTokenKey,
        tokenValue: responseModel.data["token"],
      );

      await _sessionManagement.saveSession(
        tokenKey: SessionTokenKeys.kUserModelKey,
        tokenValue: jsonEncode(responseModel.data["user"]),
      );
      return UserModel.fromJson(responseModel.data["user"]);
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> signInUser({required String email,required String password}) async {
    ResponseModel responseModel = await _client.customRequest(
      'POST',
      url: WebUrls.kSignInUrl,
      requestBody: {
        "email": email,
        "password": password,
      },
      requestHeader: {
        'Content-Type': 'application/json',
      },
    );
    log("signInUser==================> $responseModel");
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      await _sessionManagement.saveSession(
        tokenKey: SessionTokenKeys.kUserTokenKey,
        tokenValue: responseModel.data["token"],
      );

      await _sessionManagement.saveSession(
        tokenKey: SessionTokenKeys.kUserModelKey,
        tokenValue: jsonEncode(responseModel.data["user"]),
      );

      log("user data is -----------${responseModel.data['user']}");
      return UserModel.fromJson(responseModel.data["user"]);
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }


  Future<dynamic> forgotPasswordUser(String email) async {
    ResponseModel responseModel = await _client.customRequest(
      'POST',
      url: WebUrls.kForgotPassUrl,
      requestBody: {'email': email},
      requestHeader: {
        'Content-Type': 'application/json',
      },
    );

    log("ForgotPassword Response: $responseModel");

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return responseModel.data["message"];
    }

    return responseModel.data["message"] ?? responseModel.statusDescription;
  }


  Future<dynamic> verifyOTP({required String email, required String otp}) async {
    ResponseModel responseModel = await _client.customRequest(
      'POST',
      url: WebUrls.kVerifyOtpUrl,
      requestBody: {
        "email": email,
        "otp": otp,
      },
      requestHeader: {
        'Content-Type': 'application/json',
      },
    );

    log("verifyOTP Response: $responseModel");

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return responseModel.data["message"];
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> resendOTP({required String email}) async {
    ResponseModel responseModel = await _client.customRequest(
      'POST',
      url: WebUrls.kResendOtpUrl,
      requestBody: {
        "email": email,
      },
      requestHeader: {
        'Content-Type': 'application/json',
      },
    );

    log("ResendOTP Response: $responseModel");

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return responseModel.data["message"];
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> resetPassword({required String email, required String newPassword}) async {
    ResponseModel responseModel = await _client.customRequest(
      'POST',
      url: WebUrls.kResetPassUrl,
      requestBody: {
        "email": email,
        "newPassword" : newPassword
      },
      requestHeader: {
        'Content-Type': 'application/json',
      },
    );

    log("ResendOTP Response: $responseModel");

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return responseModel.data["message"];
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }




}