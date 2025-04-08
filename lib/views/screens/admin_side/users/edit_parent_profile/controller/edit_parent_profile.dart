import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';
import 'package:supakids/views/services/admin_services.dart';
import 'package:supakids/views/services/user_services.dart';
import 'package:supakids/views/web_services/user_services.dart';
import '../../../../../custom_widgets/loading.dart';

class EditParentProfileController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxBool isSwitch = true.obs;
  var data = Get.arguments;

  UserServices userServices = UserServices();
  RxList<dynamic> childProfiles = <dynamic>[].obs;



  // var childProfile = [
  //   {"name": kAlexs, "age": kEightYears, "favourite" : kArtLearning},
  //   {"name": kIqra, "email": kTenYears,  "favourite" : kSportAnimals},
  // ].obs;

  @override
  void onInit() {
    super.onInit();
    nameController.text = data['name'] ?? "NO Name";
    emailController.text = data['email'] ?? "NO Email";
    getChildProfiles();

  }

   removeProfile(int index, context) {
    showCustomDialog(
      title: kDelProfile,
      middleText: kSureToDel,
      onConfirm: () {
       // childProfile.removeAt(index);
       showToast(context, msg: kChildProDelSuccess, duration: 2);

      },
    );
  }

  switchToggle() {
    isSwitch.value = !isSwitch.value;
  }

  getChildProfiles() async {
    try {
      // isLoading.value = true;
      var body = {
        "userId": data['id'],
      };
      print(data['id']);

      var response = await userServices.getChildProfiles(body);
      log("GetChildProfiles response: $response");

      if (response['message'] == "Child profiles fetched successfully.") {
        childProfiles.assignAll(response['childProfiles']);
      } else {
        // showToast(Get.context!, msg: response['message'] ?? kSomeThingWrong);
      }
    } catch (e) {
      log("Error fetching child profiles: $e");
      SnackBar(content: Text("Failed"),);
      // showToast(Get.context!, msg: "Failed to fetch profiles.");
    }
    // finally {
    //   isLoading.value = false;
    // }
  }


}