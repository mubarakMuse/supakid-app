import 'dart:developer';
import 'package:get/get.dart';
import 'package:supakids/views/services/user_services.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../../custom_widgets/loading.dart';
import '../../controller/screen_time_controller.dart';



class SetScreenTimeController extends GetxController {


  RxInt hours = 0.obs;

  RxBool isSwitch1 = false.obs;
  RxBool isSwitch2 = false.obs;
  RxBool isExpanded = true.obs;
  RxBool isLoading = true .obs;

  var data = Get.arguments;

  UserServices userServices = UserServices();

  void incrementHour() {
    if (hours.value < 24) {
      hours.value++;
    }
  }

  void decrementHour() {
    if (hours.value > 1) {
      hours.value--;
    }
  }

  void resetToDefault() {
    hours.value = 1;
    isSwitch1.value = false;
    isSwitch2.value = false;
  }
  toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }
  switchToggle1() {
    isSwitch1.value = !isSwitch1.value;
  }
  switchToggle2() {
    isSwitch2.value = !isSwitch2.value;
  }


  setWatchLimit(context) async {
    try {
      var body = {
        "childId": data['id'],
        "watchLimit": hours.value * 60,
      };
      var response = await userServices.setWatchLimit(body);
      log("Set Limit Response response: $response");

      if (response['message'] == "Watch limit set successfully") {
        showToast(context, msg: kLimitSavedSuccess );
        Get.back();
        Get.find<ScreenTimeController>().getChildProfiles();
      } else {
        showToast(context, msg: kSomeThingWrong);
      }

    } catch (e) {
      log("Error: $e");
      showToast(context, msg: "Failed to create profile.");
    }
  }



}
