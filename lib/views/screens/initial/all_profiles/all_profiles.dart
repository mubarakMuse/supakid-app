import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_strings.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/helpers/global.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/loading.dart';
import '../../../custom_widgets/custom_button.dart';
import 'controller/all_profile_controller.dart';

class AllProfiles extends GetView<AllProfileController> {
  const AllProfiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
          child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 42.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 60.h,),
                          Image.asset(kSupaLogo, width: 155.w,),
                          SizedBox(height: 89.h,),
                          Obx(() => Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(kHome);
                                    },
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(28),
                                          child: Image.asset(kUserProfileIcon, width: 150.w),
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(userSD['name'] ?? kParents,
                                            style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w700)),
                                      ],
                                    ),
                                  ),
                                  if (controller.allProfiles.isNotEmpty)...[
                                    SizedBox(width: 30.w),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(kChildNavBar, arguments: controller.allProfiles.first );
                                      },
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                              borderRadius: BorderRadius.circular(28),
                                              child: Image.asset(kFirstChildIcon, width: 150.w)),
                                          SizedBox(height: 8.h),
                                          Text(controller.allProfiles.first['name'],
                                              style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w700)),
                                        ],
                                      ),
                                    ),
                                  ]

                                ],
                              ),

                              SizedBox(height: 30.h),
                              if (controller.allProfiles.length > 1)
                                Wrap(
                                  spacing: 30.w,
                                  runSpacing: 30.h,
                                  children: List.generate(controller.allProfiles.length - 1, (index) {
                                    var data = controller.allProfiles[index + 1];
                                    String profileImage;
                                    switch (index + 1) {
                                      case 1:
                                        profileImage = kSecondChildIcon;
                                        break;
                                      case 2:
                                        profileImage = kThirdChildIcon;
                                        break;
                                      default:
                                        profileImage = kProfile4;
                                    }
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(kChildNavBar, arguments: data);
                                      },
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                              borderRadius: BorderRadius.circular(28),
                                              child: Image.asset(profileImage, width: 150.w)),
                                          SizedBox(height: 8.h),
                                          Text(data['name'],
                                              style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w700)),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      CustomButton(
                        padding: 0,
                        text: kLogOut,
                        onPressed: () {
                          Get.offNamed(kLogin);
                          showToast(context, msg: kLogOutSuccess);
                        },
                        showIcon: false,
                      ),
                      SizedBox(height: 40.h,)
                    ],
                  ),
                ],
              )
          )
      ),

    );

  }
}




