
import 'package:supakids/utils/helpers/configs.dart';
import 'package:supakids/views/services/req.dart';

class AdminServices {
  var req = Req();
  //Get Users Profiles
  Future<dynamic> getAllUsers() async {
    return await req.get('${Configs.baseUrl}/api/getAllUsers');
  }

  //Post Video URL
  Future<dynamic> postVideoUrl(data) async {
    return await req.post('${Configs.baseUrl}/admin/api/addVideo', data);
  }

  //Post Bulk videos
  Future<dynamic> postBilkVideo(data) async {
    return await req.post('${Configs.baseUrl}/admin/api/addBulkVideos', data);
  }

  //Edit Video URL
  Future<dynamic> editVideoUrl(data) async {
    return await req.post('${Configs.baseUrl}/admin/api/editVideo', data);
  }
  //Get get all videos
  Future<dynamic> getAllVideos() async {
    return await req.get('${Configs.baseUrl}/admin/api/getAllVideos');
  }
  //Change status to Approved
  Future<dynamic> approvedVideo(data) async {
    return await req.post('${Configs.baseUrl}/admin/api/approveVideo', data);
  }

  //Change status to Reject
  Future<dynamic> rejectVideo(data) async {
    return await req.post('${Configs.baseUrl}/admin/api/rejectVideo', data);
  }

  //Delete Video
  Future<dynamic> deleteVideo(data) async {
    return await req.post('${Configs.baseUrl}/admin/api/deleteVideo', data);
  }

  //Add views to Video
  Future<dynamic> addViews(data) async {
    return await req.post('${Configs.baseUrl}/admin/api/viewVideo', data);
  }

}
