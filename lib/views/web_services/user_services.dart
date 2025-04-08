import 'dart:convert';
import 'dart:developer';
import 'package:supakids/views/models/child_profile_model.dart';
import 'package:supakids/views/web_services/web_urls.dart';
import '../../utils/sessions/session_management.dart';
import '../../utils/sessions/session_token_keys.dart';
import '../models/user_model.dart';
import 'http_request_client.dart';

class usingService {
  usingService._();

  static final usingService _instance = usingService._();

  factory usingService() {
    return _instance;
  }

  final HTTPRequestClient _client = HTTPRequestClient();
  final SessionManagement _sessionManagement = SessionManagement();

  Future<List<ChildProfileModel>> fetchChildProfiles({required int userId}) async {
    final token = await _sessionManagement.getSessionToken(tokenKey: SessionTokenKeys.kUserTokenKey);

    try {
      final responseModel = await _client.customRequest(
        'GET',
        url: WebUrls.kGetChildProfileUrl,
        requestBody: {"userId": userId},
        requestHeader: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      log("fetchChildProfiles Response ==> $responseModel");

      if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
        // List<dynamic> profilesData = responseModel.data["childProfiles"];
        // return profilesData.map((json) => ChildProfileModel.fromJson(json)).toList();
      }

      return [];
    } catch (e) {
      log("Error in fetchChildProfiles: $e");
      return [];
    }
  }

  //   Future<dynamic> getUserWithChild({required int userId}) async {
  //   final token = await _sessionManagement.getSessionToken(tokenKey: SessionTokenKeys.kUserTokenKey);
  //   try {
  //     final responseModel = await _client.customRequest(
  //       'GET',
  //       url: WebUrls.kGetUserWithChildUrl,
  //       requestBody: {"userId": userId},
  //       requestHeader: {
  //         'Content-Type': 'application/json',
  //         // 'Authorization': 'Bearer $token',
  //       },
  //     );
  //
  //     log("Response ==> $responseModel");
  //
  //     if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
  //       final Map<String, dynamic> userData = responseModel.data["user"];
  //
  //
  //       List<ChildProfileModel> children = (userData["children"] as List)
  //           .map((e) => ChildProfileModel.fromJson(e))
  //           .toList();
  //       return UserModel.fromJson(userData).copyWith(children: children);
  //     }
  //
  //
  //     return;
  //   } catch (e) {
  //     log("Error in UserWithChild: $e");
  //   }
  // }

  // Future<UserModel?> getUserWithChild({required int userId}) async {
  //   final token = await _sessionManagement.getSessionToken(tokenKey: SessionTokenKeys.kUserTokenKey);
  //
  //   try {
  //     final responseModel = await _client.customRequest(
  //       'POST',
  //       url: WebUrls.kGetUserWithChildUrl,
  //       requestBody: {"userId": userId},
  //       requestHeader: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //
  //     log("Response ==> ${jsonEncode(responseModel.data)}");
  //
  //     if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
  //       final Map<String, dynamic> userData = responseModel.data["user"];
  //
  //       // Parse children list
  //       List<ChildProfileModel> children = (userData["children"] as List)
  //           .map((e) => ChildProfileModel.fromJson(e))
  //           .toList();
  //
  //       // Create user model with children
  //       return UserModel.fromJson(userData).copyWith(children: children);
  //     }
  //
  //     return null;
  //   } catch (e) {
  //     log("Error in getUserWithChild: $e");
  //     return null;
  //   }
  // }


}
