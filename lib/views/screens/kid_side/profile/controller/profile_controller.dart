import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../custom_widgets/inerest_container/controller/interest_controller.dart';


class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  RxBool isExpanded = true.obs;
  var data = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    nameController.text = data['name'] ?? kAlexs;
    ageController.text = data['age'].toString() ;
    languageController.text = data['languagePreference']  ?? kEnglish;
    List<String> interests = List<String>.from(data['interests'] ?? []);
    Get.find<InterestController>().selectedInterests.assignAll(interests);

  }

  toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }


}
