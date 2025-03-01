import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../../utils/app_styles.dart';
import 'controller/onBoard_controller.dart';

class OnBoarding extends GetView<OnBoardingController> {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.currentIndex.value = index;
        },
        itemCount: controller.onboardingData.length,
        itemBuilder: (context, index) {
          final data = controller.onboardingData[index];
          return Container(
            color: data['color'],
            child: SizedBox(
              height: AppStyles.height(context),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: index == 0 ? 140 : index == 1 ? 127 : 99),
                    Image.asset(
                      data['image']!,
                      fit: BoxFit.contain,
                      width: 375,
                    ),
                    SizedBox(height: index == 0 ? 51 : index == 1 ? 80 : 55),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: index == 2 ? 52.0 : 16.0),
                      child: Text(
                        data['title']!,
                        style: AppStyles.interStyle(index == 1 ? kBlackColor : kWhiteColor, 30, FontWeight.w800),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: index == 0 ? 22 : 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 61),
                      child: Text(
                        data['description']!,
                        style: AppStyles.interStyle(index == 1 ? kBlackColor : kWhiteColor, 12, FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: index == 0 ? 132 : 108),
                    Padding(
                      padding: const  EdgeInsets.symmetric(horizontal: 36.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: ()  => Get.toNamed(kLogin),
                            child: Text(
                              kSkip,
                              style: AppStyles.interStyle(index == 1 ? kBlackColor : kWhiteColor, 20, FontWeight.w400),
                            ),
                          ),
                          Obx(() => Row(
                            children: List.generate(
                              controller.onboardingData.length,
                                  (dotIndex) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                height: 6.0,
                                width: controller.currentIndex.value == dotIndex ? 24.0 : 8.0,
                                decoration: BoxDecoration(
                                  color: controller.currentIndex.value == dotIndex
                                      ? index == 1 ? kBlackColor : kWhiteColor
                                      : index == 1 ? kBlackColor.withOpacity(0.2) : kWhiteColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                          )),
                          GestureDetector(
                            onTap: () {
                              if (index < controller.onboardingData.length - 1) {
                                controller.pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                Get.toNamed(kLogin);
                              }
                            },
                            child: Container(
                              height: 41,
                              width: 41,
                              decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 1 ? kBlackColor : kWhiteColor,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 12,
                                color: index == 0 ? kRedColor
                                : index == 1 ? kYellowColor
                                    : kGreenColor
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60,),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
