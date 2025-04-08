
import 'package:dio/dio.dart';
import 'package:supakids/views/services/storage.dart';
class DioConfig {
  var dio = Dio();
  DioConfig() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String token  = await Storage.getToken();
          options.headers['Content-Type'] = 'application/json';
          options.headers["authorization"] = 'Bearer $token';
          // print('Token is here.............: $token');
          return handler.next(options);
        },
        onResponse: (e, handler) async {
          return handler.next(e);
        },
        onError: (e, handler) async {
          return handler.next(e);
        },
      ),
    );
  }
}

class Req {
  var interceptor = DioConfig();
  get(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      var resp = await interceptor.dio.get(url, queryParameters: queryParameters);
      return resp.data;
    } on DioException catch (e) {
      return {"status": e.response?.statusCode.toString()};
    }
  }

  post(String url, data) async {
    try {
      var resp = await interceptor.dio.post(url, data: data);
      return resp.data;
    } on DioException catch (e) {
      print(e.response?.statusCode.toString());
      return {"status": e.response?.statusCode.toString()};
    }
  }

  postReq(String url) async {
    try {
      var resp = await interceptor.dio.post(url);
      return resp.data;
    } on DioException catch (e) {
      print(e.response?.statusCode.toString());
      return {"status": e.response?.statusCode.toString()};
    }
  }

  getReq(String url, data) async {
    try {
      var resp = await interceptor.dio.get(url, data: data);
      return resp.data;
    } on DioException catch (e) {
      return {"status": e.response?.statusCode.toString()};
    }
  }

}

