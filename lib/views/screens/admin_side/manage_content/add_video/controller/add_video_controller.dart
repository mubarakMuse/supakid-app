import 'dart:developer';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';
import 'package:supakids/views/services/admin_services.dart';
import '../../../../../custom_widgets/loading.dart';
import '../../controller/content_controller.dart';


class AddVideoController extends GetxController {
  TextEditingController linkController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  AdminServices adminServices = AdminServices();
  var dropdownError = ''.obs;
  var selectedValue = ''.obs;
  var selectedList = ''.obs;
  var isExpanded = false.obs;
  RxString linkError = ''.obs;
  RxString titleError = ''.obs;
  RxString descriptionError = ''.obs;
  RxBool isLoading = false.obs;
  final List<String> category = [kSports, kLearning, kSpace, kArt, kAnimal];
  final List<String> content = [kMatured ,kImatured];

  void toggleUI() {
    isExpanded.value = !isExpanded.value;
  }
  var fileName = "".obs;
  File? selectedFile;

  // Future<void> pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['csv'],
  //   );
  //   if (result != null) {
  //     selectedFile = File(result.files.single.path!);
  //     fileName.value = result.files.single.name;
  //   }
  // }
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
      withData: true,
    );

    if (result != null) {
      int fileSize = result.files.single.size;
      double fileSizeInMB = fileSize / (1024 * 1024);

      if (fileSizeInMB > 2) {
        showToast(Get.context!, msg: "File size must be less than 2MB!");
        return;
      }
      selectedFile = File(result.files.single.path!);
      fileName.value = result.files.single.name;
    }
  }


  postVideo(context) async {
    linkError.value = linkController.text.isEmpty ? kLinkReq : '';
    titleError.value = titleController.text.isEmpty ? kTitleReq : '';
    descriptionError.value = descriptionController.text.isEmpty ? kDescriptionReq : '';
    try {
      var data = {
        "youtubeUrl": linkController.text,
        "title": titleController.text,
        "description": descriptionController.text,
        "ContentType":  selectedList.value,
        "category":  selectedValue.value,
      };
      var response = await adminServices.postVideoUrl(data);
      log("Post Video response: $response");

      if (response['message'] == "Video added successfully") {
        showToast(context, msg: kVideoSubmit );
        Get.back();
        Get.find<ContentController>().getAllVideos();
      } else {
        showToast(context, msg: kSomeThingWrong);
      }
    } catch (e) {
      log("Error: $e");
    }
  }

  postBulkVideo(context) async {
    if (selectedFile == null) {
      showToast(context, msg: kSelectFile );
      return;
    }

    isLoading.value = true;
    try {
      String csvData = await selectedFile!.readAsString();
      List<List<dynamic>> rows = const CsvToListConverter().convert(csvData);

      List<Map<String, String>> videoList = rows.skip(1).map((row) {
        return {
          "title": row[0].toString(),
          "youtubeUrl": row[1].toString(),
          "category": row[2].toString(),
          "ContentType": row[3].toString(),
          "description": row[4].toString(),
        };
      }).toList();

      var response = await adminServices.postBilkVideo({"videos": videoList});
      if (response['message'] == "Bulk Videos added successfully") {
        showToast(context, msg: kVideoUpload );
        Get.back();
        Get.find<ContentController>().getAllVideos();
      } else {
        showToast(context, msg: kSomeThingWrong);
      }
    } catch (e) {
      log("Error, Failed to upload: $e");
    }finally {
      isLoading.value = false;
    }
  }

}
