import 'dart:developer';

import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';
import 'package:supakids/views/services/admin_services.dart';
import '../../../../custom_widgets/loading.dart';

class ContentController extends GetxController {

  AdminServices adminServices = AdminServices();
  RxList<dynamic> allVideos = <dynamic>[].obs;
  var videosTitles = [
    {"title": "Learn Colors with Animals", "category": kLearning, "views" : "12,000", "status" : "Pending"},
    {"title": "Draw a Pencil using colors", "category": kArt, "views" : "9000","status" : "Pending"},
    {"title": "How to Play cricket", "category": kSports, "views" : "14564","status" : "Approved"},
    {"title": "How to Play cricket", "category": kSports, "views" : "14564","status" : "Rejected"},
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getAllVideos();
  }



  getAllVideos() async {
    try {
      var response = await adminServices.getAllVideos();
      if (response['message'] == "Videos retrieved successfully") {
        allVideos.assignAll(response['data']);
        log("getAllVideos response: $allVideos");
      }
    } catch (e) {
      log("Error fetching child profiles: $e");
    }
  }

  approveVideo(int index, context) {
    showCustomDialog(
      title: kApproveVideo,
      middleText: kSureToApprove,
      onConfirm: () async {
        try {
          var videoId = allVideos[index]['id'];
          var data = {"id": videoId};
          var response = await adminServices.approvedVideo(data);

          log("Approve Video response: $response");

          if (response['message'] == "Video approved") {
            allVideos[index]['status'] = "Approved";
            allVideos.refresh();
            showToast(context, msg: kVideoDelSuccess, duration: 2);
          } else {
            showToast(context, msg: kSomeThingWrong, duration: 2);
          }
        } catch (e) {
          log("Error approving video: $e");
        }
      },
    );
  }

  rejectVideo(int index, context) {
    showCustomDialog(
      title: kRejectVideo,
      middleText: kSureToReject,
      onConfirm: () async {
        try {
          var videoId = allVideos[index]['id'];
          var data = {"id": videoId};
          var response = await adminServices.rejectVideo(data);
          log("Rejected Video response: $response");
          if (response['message'] == "Video rejected") {
            allVideos[index]['status'] = "Rejected";
            allVideos.refresh();
            showToast(context, msg: kVideoRejectSuccess, duration: 2);
          } else {
            showToast(context, msg: kSomeThingWrong, duration: 2);
          }
        } catch (e) {
          log("Error reject video: $e");
        }
      },
    );
  }

  deleteVideo(int index, context) {
    showCustomDialog(
      title: kDelVideo,
      middleText: kSureToDel,
      onConfirm: () async {
        try {
          var videoId = allVideos[index]['id'];
          var data = {"id": videoId};
          var response = await adminServices.deleteVideo(data);
          log("Delete Video response: $response");
          if (response['message'] == "Video deleted successfully") {
            allVideos.removeAt(index);
            allVideos.refresh();
            showToast(context, msg: kVideoDelSuccess, duration: 2);
          } else {
            showToast(context, msg: kSomeThingWrong, duration: 2);
          }
        } catch (e) {
          log("Error delete video: $e");
        }
      },
    );
  }




}
