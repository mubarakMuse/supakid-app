import 'dart:developer';
import 'package:get/get.dart';
import 'package:supakids/views/services/user_services.dart';
import '../../../../../utils/helpers/global.dart';
import '../../../../custom_widgets/loading.dart';

class  AllProfileController extends GetxController {
  var selectedImage = ''.obs;
  UserServices userServices = UserServices();
  RxList<dynamic> allProfiles = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    getChildProfiles();
  }
  void selectImage(String imagePath) {
    if (selectedImage.value == imagePath) {
      selectedImage.value = '';
    } else {
      selectedImage.value = imagePath;
    }
  }

  void clearSelection() {
    selectedImage.value = '';
  }


  getChildProfiles() async {
    try {
      var data = {
        "userId": userSD['id'],
      };
      var response = await userServices.getChildProfiles(data);
      if (response['message'] == "Child profiles fetched successfully.") {
        allProfiles.assignAll(response['childProfiles']);
        // log("GetChildProfiles response: $allProfiles");
      } else {
      }
    } catch (e) {
      log("Error fetching child profiles: $e");
      showToast(Get.context!, msg: "Failed to fetch profiles.");
    }
  }
}
