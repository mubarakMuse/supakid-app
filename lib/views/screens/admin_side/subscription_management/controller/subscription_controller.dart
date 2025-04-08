import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';
import '../../../../custom_widgets/loading.dart';

class SubscriptionManagementController extends GetxController {
  var videosTitles = [
    {"name": "John Doe", "email": "john@example.com"},
    {"name": "Jane Smith", "email": "jane@example.com"},
    {"name": "Alice Johnson", "email": "alice@example.com"},
  ].obs;

   approveVideo(int index, context) {
     showCustomDialog(
       title: kApproveVideo,
       middleText: kSureToApprove,
       onConfirm: () {
         videosTitles[index]['status'] = 'Approved';
         videosTitles.refresh();
         showToast(context, msg: kVideoApprovedSuccess, duration: 2);
       },
     );
  }

  rejectVideo(int index, context) {
    showCustomDialog(
      title: kRejectVideo,
      middleText: kSureToReject,
      onConfirm: () {
        videosTitles[index]['status'] = 'Rejected';
        videosTitles.refresh();
        showToast(context, msg: kVideoRejectSuccess, duration: 2);
      },
    );
  }
  deleteVideo(int index, context) {
    showCustomDialog(
      title: kDelVideo,
      middleText: kSureToDelVideo,
      onConfirm: () {
        videosTitles.removeAt(index);
        showToast(context, msg: kVideoDelSuccess, duration: 2);
      },
    );
  }
}
