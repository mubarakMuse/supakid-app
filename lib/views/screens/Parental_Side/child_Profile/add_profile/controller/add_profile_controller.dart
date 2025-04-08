import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/helpers/global.dart';
import 'package:supakids/views/screens/initial/all_profiles/controller/all_profile_controller.dart';
import 'package:supakids/views/screens/parental_side/child_Profile/all_child_profiles/all_child_profiles.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../../custom_widgets/inerest_container/controller/interest_controller.dart';
import '../../../../../custom_widgets/loading.dart';
import '../../../../../services/user_services.dart';
import '../../all_child_profiles/controller/all_child_profiles_controller.dart';

class AddProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  RxString selectedGender = 'Male'.obs;
  RxString contentLanguage = 'English'.obs;
  UserServices userServices = UserServices();

  RxBool isExpanded = true.obs;
  RxString nameError = ''.obs;
  RxString ageError = ''.obs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    super.onReady();
    resetFields();
  }

  void updateGender(String value) {
    selectedGender.value = value;
  }
  void updateContentLanguage(String value) {
    contentLanguage.value = value;
  }

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }

  void validateFields() {
    nameError.value = nameController.text.trim().isEmpty ? kNameRequired : '';
    ageError.value = ageController.text.trim().isEmpty ? kAgeRequired : '';
  }

  void resetFields() {
    nameController.clear();
    ageController.clear();
    selectedGender.value = "";
    contentLanguage.value = "";
    Get.find<InterestController>().selectedInterests.clear();
  }


createProfile(context) async {
      validateFields();
      if (nameError.isNotEmpty || ageError.isNotEmpty) return;
      isLoading.value = true;
      try {
        var data = {
          "userId": userSD['id'],
          "name": nameController.text,
          "age": int.tryParse(ageController.text) ?? 0,
          "languagePreference": contentLanguage.value.isNotEmpty ? contentLanguage.value : "English",
          "interests":  Get.find<InterestController>().selectedInterests,
          "gender": selectedGender.value.isNotEmpty ? selectedGender.value : "Male",
        };

        var response = await userServices.createChildProfile(data);
        log("CreateChildProfile response: $response");

        if (response['message'] == "Child profile created successfully.") {
          showToast(context, msg: kChildProCreateSuccess );
          Get.offNamed(kAllProfiles);
          Get.find<AllProfileController>().getChildProfiles();
          Get.find<AllChildProfilesController>().getChildProfiles();
        } else {
          showToast(context, msg: kYouAlreadyHave);
        }

      } catch (e) {
        log("Error: $e");
        showToast(context, msg: "Failed to create profile.");
      } finally {
        isLoading.value = false;
      }
    }

}
