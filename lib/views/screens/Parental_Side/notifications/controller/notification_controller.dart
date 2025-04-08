import 'package:get/get.dart';
import '../../../../../../utils/app_strings.dart';

class NotificationController extends GetxController {
  var notificationList = [
    {"title": kEmaReached, "time": kTime1},
    {"title": kAlexAdded, "time": kTime1},
    {"title": kNewVideo, "time": kTime1},
    {"title": "Another Notification", "time": kTime1},
    {"title": "Last Notification", "time": kTime1},
  ].obs;

  var displayCount = 3.obs;

  void loadMore() {
    if (displayCount.value < notificationList.length) {
      displayCount.value += 2;
    }
  }
}
