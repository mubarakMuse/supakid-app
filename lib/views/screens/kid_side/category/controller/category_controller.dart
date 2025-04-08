import 'dart:developer';
import 'package:get/get.dart';
import 'package:supakids/views/services/child_services.dart';

class CategoryController extends GetxController {

  var data = Get.arguments;

  ChildServices childServices = ChildServices();
  RxList<dynamic> allVideos = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    getVideosByCategory();
  }

  getVideosByCategory() async {
    try {
      var body = {
        "category" : data['label']
      };
      var response = await childServices.getVideosByCategory(body);
      if (response['message'] == "Videos retrieved successfully") {
        allVideos.assignAll(response['data']);
        log("getAllVideos response: $allVideos");
      }
    } catch (e) {
      log("Error fetching child profiles: $e");
    }

  }


}
