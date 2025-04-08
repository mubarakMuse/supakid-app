import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supakids/views/screens/parental_side/child_Profile/all_child_profiles/controller/all_child_profiles_controller.dart';
import 'package:supakids/views/services/user_services.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../../../utils/helpers/global.dart';
import '../../../../../custom_widgets/inerest_container/controller/interest_controller.dart';
import '../../../../../custom_widgets/loading.dart';
import '../../../../initial/all_profiles/controller/all_profile_controller.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  UserServices userServices = UserServices();

  RxString selectedGender = 'Male'.obs;
  RxString contentLanguage = 'English'.obs;
  var data = Get.arguments;

  void updateContentLanguage(String value) {
    contentLanguage.value = value;
  }

  void updateGender(String value) {
    selectedGender.value = value;
  }

  RxBool isExpanded = true.obs;
  RxString nameError = ''.obs;
  RxString ageError = ''.obs;
  RxBool isSwitch1 = true.obs;
  RxBool isSwitch2 = true.obs;

  void validateFields() {
    nameError.value = nameController.text.trim().isEmpty ? kNameRequired : '';
    ageError.value = ageController.text.trim().isEmpty ? kAgeRequired : '';
  }
  @override
  void onInit() {
    super.onInit();
      nameController.text = data['name'] ?? '';
      ageController.text = data['age']?.toString() ?? '';
      contentLanguage.value = data['languagePreference'] ?? '';
      selectedGender.value = data['gender'] ?? '';
      List<String> interests = List<String>.from(data['interests'] ?? []);
      Get.find<InterestController>().selectedInterests.assignAll(interests);
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
  updateProfile(context) async {
    validateFields();
    try {
      var body = {
        "childId": data['id'],
        "name": nameController.text.trim(),
        "age": int.tryParse(ageController.text) ?? 0,
        "languagePreference": contentLanguage.value,
        "interests": Get.find<InterestController>().selectedInterests,
        "gender": selectedGender.value,
      };
      var response = await userServices.editChildProfile(body);
      log("UpdateChildProfile response: $response");

      if (response['message'] == "Child profile updated successfully.") {
        showToast(context, msg: kChildProUpdateSuccess);
        Get.offNamed(kChildPro);
        Get.find<AllChildProfilesController>().getChildProfiles();
      } else {
        showToast(context, msg: kSomeThingWrong);
      }
    } catch (e) {
      log("Error: $e");
      showToast(context, msg: "Failed to update profile.");
    }
  }

 deleteProfile(context) async {
    try {
      var body = {
        "userId": userSD['id'],
        "childId": data['id'],
      };
      var response = await userServices.deleteChildProfile(body);

      if (response['message'] == "Child profile deleted successfully.") {
        showToast(context, msg: "Profile deleted successfully.");
        Get.offNamed(kAllProfiles);
        Get.find<AllChildProfilesController>().getChildProfiles();
        Get.find<AllProfileController>().getChildProfiles();
      } else {
        showToast(context, msg: response['message'] ?? kSomeThingWrong);
      }
    } catch (e) {
      showToast(context, msg: "Failed to delete profile.");
    }
  }



}
