
import 'package:supakids/utils/helpers/configs.dart';
import 'package:supakids/views/services/req.dart';
import 'package:supakids/views/services/storage.dart';

class UserServices {
  var req = Req();
  // Create Child Profile
  Future<dynamic> createChildProfile(data) async {
    return await req.post('${Configs.baseUrl}/api/createChildProfile', data);
  }
    //Get Child Profiles
    Future<dynamic> getChildProfiles(data) async {
      return await req.getReq('${Configs.baseUrl}/api/getChildProfiles', data);
    }
  //Edit Child Profiles
  Future<dynamic> editChildProfile(data) async {
    return await req.post('${Configs.baseUrl}/api/updateChildProfile', data);
  }
  //Edit Child Profiles
  Future<dynamic> deleteChildProfile(data) async {
    return await req.post('${Configs.baseUrl}/api/delChildProfile', data);
  }
  //Set watch limit for a child
  Future<dynamic> setWatchLimit(data) async {
    return await req.post('${Configs.baseUrl}/api/setWatchLimit', data);
  }

  //Check watch limit for a child
  Future<dynamic> checkWatchLimit(data) async {
    return await req.getReq('${Configs.baseUrl}/api/checkWatchLimit', data);
  }
  //Update watch time for a child
  Future<dynamic> updateWatchTime(data) async {
    return await req.post('${Configs.baseUrl}/api/updateWatchTime', data);
  }



}
