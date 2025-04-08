import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';
import 'package:supakids/views/services/admin_services.dart';
import '../../../../../custom_widgets/loading.dart';
import '../../controller/content_controller.dart';


class EditVideoController extends GetxController {

  TextEditingController linkController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  
  var data = Get.arguments;
  RxBool isLoading = false.obs;

  AdminServices adminServices = AdminServices();
  var dropdownError = ''.obs;
  var selectedCategory = ''.obs;
  var selectedContent = ''.obs;
  final List<String> items = [kSports, kLearning, kSpace, kArt, kAnimal];
  final List<String> list = [kMatured ,kImatured];

  RxString linkError = ''.obs;
  RxString titleError = ''.obs;
  RxString descriptionError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    linkController.text = data['youtubeUrl'] ?? 'No Url';
    titleController.text = data['title'] ?? '';
    descriptionController.text = data['description'] ?? '';
    selectedCategory.value = data['category'] ?? "No category";
    selectedContent.value = data['ContentType'] ?? kMatured;
  }

  editVideo(context) async {
    linkError.value = linkController.text.isEmpty ? kLinkReq : '';
    titleError.value = titleController.text.isEmpty ? kTitleReq : '';
    descriptionError.value = descriptionController.text.isEmpty ? kDescriptionReq : '';
    try {
      var body = {
        "id" : data['id'],
        "youtubeUrl": linkController.text,
        "title": titleController.text,
        "description": descriptionController.text,
        "ContentType":  selectedContent.value,
        "category":  selectedCategory.value,
      };
      var response = await adminServices.editVideoUrl(body);
      log("Updated Video response: $response");

      if (response['message'] == "Video updated successfully") {
        showToast(context, msg: kVideoUpdated );
        Get.back();
        Get.find<ContentController>().getAllVideos();
      } else {
        showToast(context, msg: kSomeThingWrong);
      }
    } catch (e) {
      log("Error: $e");
    }
  }

}
