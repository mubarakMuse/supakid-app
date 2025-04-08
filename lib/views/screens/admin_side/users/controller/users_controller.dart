import 'dart:developer';
import 'package:get/get.dart';
import 'package:supakids/views/services/admin_services.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/loading.dart';


class UserController extends GetxController{

  AdminServices adminServices = AdminServices();
  RxList<dynamic> allUsers = <dynamic>[].obs;


  @override
  void onInit() {
    super.onInit();
    getAllProfiles();
  }


  removeProfile(int index, context) {
    showCustomDialog(
      title: kDelProfile,
      middleText: kSureToDel,
      onConfirm: () {
        // parentProfile.removeAt(index);
        showToast(context, msg: kParentProDelSuccess, duration: 2);

      },
    );
  }

  getAllProfiles() async {
    try {
      var response = await adminServices.getAllUsers();
      if (response['message'] == "Users retrieved successfully.") {
        allUsers.assignAll(response['users']);
        log("GetAllUsers response: $allUsers");
      }
    } catch (e) {
      log("Error fetching child profiles: $e");
    }
  }

// getAllProfiles() async {
  //   try {
  //     var response = await adminServices.getAllUsersWithChildren();
  //     if (response['message'] == "Users with children fetched successfully.") {
  //       allUsers.assignAll(response['users']);
  //       childrenWithParent.assignAll(response['users']['children']);
  //       log("GetChildProfiles response: $allUsers");
  //       log("GetChildProfiles response: $childrenWithParent");
  //     } else {
  //     }
  //   } catch (e) {
  //     log("Error fetching child profiles: $e");
  //     // showToast(context, msg: "Failed to fetch profiles.");
  //   }
  // }
}