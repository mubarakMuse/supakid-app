import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import '../../../../../utils/app_images.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Container(
          width: AppStyles.width(context),
          height: AppStyles.height(context),
          decoration: const BoxDecoration(
            color: kPrimaryColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                height: controller.logoSize.value,
                width: controller.logoSize.value,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
                child: Center(
                    child: Image.asset(kSpLogo,fit: BoxFit.cover, width: 400,)),
              ),
            ],
          ),
        ),
      );
    },);
  }

}
