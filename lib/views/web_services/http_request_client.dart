import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../utils/app_constants.dart';
import '../../utils/sessions/session_management.dart';
import '../../utils/sessions/session_token_keys.dart';
import '../models/response_model.dart';


class HTTPRequestClient {
  HTTPRequestClient._();

  static final HTTPRequestClient _instance = HTTPRequestClient._();

  factory HTTPRequestClient() {
    return _instance;
  }

  Future<ResponseModel> customRequest(
    String requestType, {
    required String url,
    bool isBearerHeaderRequired = false,
    dynamic requestBody,
    dynamic requestHeader,
  }) async {
    try {
      ResponseModel responseModel = ResponseModel();
      Map<String, String> header = {};
      if (isBearerHeaderRequired) {
        header = await getRequestHeader(isBearer: true);
      }
      http.Request request = http.Request(
        requestType,
        Uri.parse(url),
      );
      request.headers.addAll(requestHeader ?? header);
      if(requestBody!=null) {
        request.body = jsonEncode(requestBody);
      }
      http.StreamedResponse response = await request.send();
      if ((response.statusCode >= 200 && response.statusCode <= 230)) {
        responseModel = ResponseModel.named(
          data: jsonDecode(await response.stream.bytesToString()),
          statusCode: response.statusCode,
          statusDescription: response.reasonPhrase.toString(),
        );
      } else {
        responseModel = ResponseModel.errorFromJson(
          jsonDecode(await response.stream.bytesToString()),
          statusCode: response.statusCode,
        );
      }
      return responseModel;
    } on SocketException catch (e) {
      return Future.value(
        ResponseModel.named(
          statusCode: 400,
          statusDescription: AppConstants.serverFailureMessage,
          data: e.toString(),
        ),
      );
    } catch (e) {
      return Future.value(
        ResponseModel.named(
          statusCode: 500,
          statusDescription: AppConstants.generalFailureMessage,
          data: e.toString(),
        ),
      );
    }
  }

  Future<Map<String, String>> getRequestHeader({
    bool isBearer = true,
    bool isContentType = true,
  }) async {
    String token = await SessionManagement().getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    Map<String, String> header = {
      'Authorization': isBearer ? 'Bearer $token' : token,
      if (isContentType) 'Content-Type': 'application/json'
    };
    return header;
  }
}
