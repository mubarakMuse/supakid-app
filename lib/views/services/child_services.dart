
import 'package:supakids/utils/helpers/configs.dart';
import 'package:supakids/views/services/req.dart';

class ChildServices {
  var req = Req();

  //Get Users Profiles
  Future<dynamic> getVideosByCategory(data) async {
    return await req.getReq('${Configs.baseUrl}/admin/api/getVideosByCategory', data);
  }
  //Get Users Profiles
  Future<dynamic> incrementView(data) async {
    return await req.post('${Configs.baseUrl}/api/viewVideo', data);
  }


}
