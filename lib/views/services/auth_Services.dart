
import 'package:supakids/utils/helpers/configs.dart';
import 'package:supakids/views/services/req.dart';

class AuthServices {
  var req = Req();
  //Signup
  Future<dynamic> signup(data) async {
    return await req.post('${Configs.baseUrl}/api/auth/signup', data);
  }
  //Login
  Future<dynamic> login(data) async {
    return await req.post('${Configs.baseUrl}/api/auth/login', data);
  }

}
