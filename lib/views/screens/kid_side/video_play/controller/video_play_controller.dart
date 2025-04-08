// import 'dart:developer';
// import 'package:get/get.dart';
// import 'package:supakids/utils/app_strings.dart';
// import 'package:supakids/views/services/admin_services.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import '../../../../../utils/app_images.dart';
// import '../../../../services/user_services.dart';
//
// class VideoPlayController extends GetxController {
//
//   var data = Get.arguments;
//
//
//   var nextWatching = [
//     {"image": kNextWatch1, "title": kSpaceKids, "time": kTime1},
//     {"image": kNextWatch2, "title": kFunAnimals, "time": kTime2},
//     {"image": kNextWatch3, "title": kDrawing , "time": kTime3},
//   ].obs;
//
//   AdminServices adminServices = AdminServices();
//
//     late YoutubePlayerController youtubeController;
//   var videoUrl = ''.obs;
//   RxInt watchDuration = 0.obs;
//
//   @override
//   void onInit() async {
//     super.onInit();
//     videoUrl.value = data["youtubeUrl"];
//     String? videoId = YoutubePlayer.convertUrlToId(videoUrl.value);
//     if (videoId != null) {
//       youtubeController = YoutubePlayerController(
//         initialVideoId: videoId,
//         flags: const YoutubePlayerFlags(
//           autoPlay: true,
//           mute: false,
//           loop: false,
//           enableCaption: false,
//           useHybridComposition: true,
//         ),
//       );
//     }
//
//   }
//
//
//   @override
//   void onClose() {
//     if (youtubeController.value.isPlaying) {
//       youtubeController.pause();
//     }
//     youtubeController.dispose();
//     super.onClose();
//   }
//
//
//   RxInt remainingTime = 0.obs;
//   UserServices userServices = UserServices();
//
//
//    checkWatchLimit() async {
//     try {
//       var body = {
//         "childId": 26
//       };
//       var response = await userServices.checkWatchLimit(body);
//
//       if (response != null && response['remainingTime'] != null) {
//         remainingTime.value = response['remainingTime'];
//       }
//     } catch (e) {
//       log("Error fetching watch limit: $e");
//     }
//   }
//
//
//    updateWatchTime() async {
//     try {
//       var body = {
//         "childId": 26,
//         "watchDuration": watchDuration.value,
//       };
//
//       var response = await userServices.updateWatchTime(body);
//
//       if (response != null && response['message'] == "Watch time updated") {
//         log("Watch time updated successfully: ${response['watchTimeToday']}");
//       } else {
//         Get.snackbar("Limit Exceeded", "You have exceeded your watch limit.");
//       }
//     } catch (e) {
//       log("Error updating watch time: $e");
//     }
//   }
//
//
// }
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_strings.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../utils/app_images.dart';
import '../../../../services/user_services.dart';


class VideoPlayController extends GetxController {
  var data = Get.arguments;
  late YoutubePlayerController youtubeController;
  var videoUrl = ''.obs;
  var isVideoLoaded = false.obs;
  RxInt remainingTime = (-1).obs;
  Timer? _watchTimer;
  UserServices userServices = UserServices();

  @override
  void onInit() async {
    super.onInit();
    youtubeController = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: false,
        enableCaption: false,
        useHybridComposition: true,
      ),
    );

    await checkWatchLimit();

    if (remainingTime.value > 0) {
      videoUrl.value = data["youtubeUrl"];
      String? videoId = YoutubePlayer.convertUrlToId(videoUrl.value);
      if (videoId != null) {
        youtubeController = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
            loop: false,
            enableCaption: false,
            useHybridComposition: true,
          ),
        );
        isVideoLoaded.value = true;
        startWatchTimer();
      }
    } else {
      log("Watch limit exceeded. Video playback is restricted.");
    }


    ever(remainingTime, (value) {
      if (value == 0) {
        handleWatchLimitExceeded();
      }
    });
  }

  void startWatchTimer() {
    _watchTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (remainingTime.value > 0) {
        updateWatchTime();
      } else {
        handleWatchLimitExceeded();
      }
    });
  }
   updateWatchTime() async {
    try {
      var body = {"childId": 26, "watchDuration": 1};
      var response = await userServices.updateWatchTime(body);

      if (response != null && response['watchTimeToday'] != null) {
        remainingTime.value -= 1;
        log("Watch time updated: ${remainingTime.value} minutes remaining");
      }
    } catch (e) {
      log("Error updating watch time: $e");
    }
  }

  checkWatchLimit() async {
    try {
      var body = {"childId": 26};
      var response = await userServices.checkWatchLimit(body);

      if (response != null && response['remainingTime'] != null) {
        remainingTime.value = response['remainingTime'];
      }
    } catch (e) {
      log("Error fetching watch limit: $e");
    }
  }

   handleWatchLimitExceeded() {
    stopVideo();
    Get.back();
    showWatchLimitSnackBar();
  }

  void stopVideo() {
    _watchTimer?.cancel();
    youtubeController.pause();
    log("Watch limit reached. Navigating back.");
  }

  void showWatchLimitSnackBar() {
    Get.snackbar(
      "Watch Limit Reached",
      "Your watch time limit has been reached. Video playback is restricted.",
      backgroundColor: kRedColor,
      colorText: kWhiteColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      icon: const Icon(Icons.error, color: kWhiteColor),
    );
  }

  @override
  void onClose() {
    _watchTimer?.cancel();
    youtubeController.dispose();
    super.onClose();
  }
}


