import 'dart:developer';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';
import 'package:supakids/views/services/user_services.dart';
import '../../../../../../utils/helpers/global.dart';
import '../../../../../custom_widgets/loading.dart';

class AllChildProfilesController extends GetxController {
  UserServices userServices = UserServices();
  RxList<dynamic> childProfiles = <dynamic>[].obs;
  RxBool isLoading = true .obs;

  @override
  void onInit() {
    super.onInit();
    getChildProfiles();
  }

  getChildProfiles() async {
    try {
      isLoading.value = true;
      var data = {
        "userId": userSD['id'],
      };
      var response = await userServices.getChildProfiles(data);
      log("GetChildProfiles response: $response");

      if (response['message'] == "Child profiles fetched successfully.") {
        childProfiles.assignAll(response['childProfiles']);
      } else {
        showToast(Get.context!, msg: response['message'] ?? kSomeThingWrong);
      }
    } catch (e) {
      log("Error fetching child profiles: $e");
      showToast(Get.context!, msg: "Failed to fetch profiles.");
    }finally {
      isLoading.value = false;
    }
  }




}
