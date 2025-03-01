import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';

import '../../../../../custom_widgets/loading.dart';

class YoutubePlaylistController extends GetxController {
  var playlist = <String>[
    kNational,
    kPBSKids,
    kStoryTime,
    kNational
  ].obs;

  void removeItem(BuildContext context, int index) {
    showLoader(context, kRemoveChannel, );
    Future.delayed(const Duration(seconds: 1), () {
      playlist.removeAt(index);
      showToast(context, msg: kSuccessChannel, duration: 2);
     Get.back();
    });
  }
}
