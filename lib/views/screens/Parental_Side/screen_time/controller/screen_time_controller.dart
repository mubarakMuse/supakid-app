import 'dart:developer';
import 'package:get/get.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../../utils/helpers/global.dart';
import '../../../../custom_widgets/loading.dart';
import '../../../../services/user_services.dart';


class ScreenTimeController extends GetxController {

  RxBool isLoading = true .obs;
  UserServices userServices = UserServices();
    RxList<dynamic> childProfiles = <dynamic>[].obs;

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
