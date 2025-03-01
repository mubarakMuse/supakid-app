import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';

class OnBoardingController extends GetxController {
  var currentIndex = 0.obs;
  final PageController pageController = PageController();

  List onboardingData = [
    {
      "image": konBoard1,
      "title": kTitle1,
      "description": kDescription1,
      "color": kRedColor
    },
    {
      "image": konBoard2,
      "title": kTitle2,
      "description": kDescription2,
      "color": kYellowColor,
    },
    {
      "image": konBoard3,
      "title": kTitle3,
      "description": kDescription3,
      "color": kGreenColor,
    },
  ];

  void nextPage() {
    if (currentIndex.value < onboardingData.length - 1) {
      currentIndex.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
