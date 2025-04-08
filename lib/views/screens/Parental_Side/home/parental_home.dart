import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/helpers/global.dart';
import '../../../../utils/app_strings.dart';
import '../../../custom_widgets/background_container.dart';
import '../../../custom_widgets/custom_container.dart';
import 'controller/home_controller.dart';

class ParentalHomeScreen extends GetView<HomeController> {
  const ParentalHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               SizedBox(height: 60.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kWelcome, style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w800),),
                        SizedBox(height: 2.h,),
                        Text(userSD['name'] ?? kParents, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                      ],
                    ),
                    Image.asset(kSupaLogo, width: 125.w,),
                  ],
                ),
                SizedBox(height: 24.h,),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHomeContainer(
                        index: 0,
                        selectedIndex: controller.selectedIndex.value,
                        onPressed: () {
                          controller.changeSelectedIndex(0);
                          Get.toNamed(kChildPro);
                        },
                        image: kProfile,
                        height2: 10.h,
                        heading: kChildProfile,
                        height3: 5.h,
                        subHeading: kAddEdit
                    ),
                    CustomHomeContainer(
                        index: 1,
                        selectedIndex: controller.selectedIndex.value,
                        onPressed: () {
                          controller.changeSelectedIndex(1);
                          Get.toNamed(kContentPrefer);
                        },
                        image: kPrefer,
                        width: 25.w,
                        heading: kContent,
                        subHeading: kSetContent
                    ),
                  ],
                ),),
                SizedBox(height: 24.h,),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHomeContainer(
                        index: 2,
                        selectedIndex: controller.selectedIndex.value,
                        onPressed: () {
                          controller.changeSelectedIndex(2);
                          Get.toNamed(kScreenTime);
                        },
                        height1: 25.h,
                        image: kMobIcon,
                        width: 19,
                        heading: kScreenTimes,
                        subHeading: kViewRecent),
                    CustomHomeContainer(
                        index: 3,
                        selectedIndex: controller.selectedIndex.value,
                        onPressed: () {
                          controller.changeSelectedIndex(3);
                          Get.toNamed(kYoutubePlaylist);
                        },
                        height1: 26.h,
                        image: kYoutube,
                        height2: 3.h,
                        width: 36.w,
                        heading: kPlaylist,
                        height3: 0,
                        subHeading: kManage),
                  ],
                ),),
                SizedBox(height: 24.h,),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHomeContainer(
                        index: 4,
                        selectedIndex: controller.selectedIndex.value,
                        onPressed: () {
                          controller.changeSelectedIndex(4);
                          Get.toNamed(kActiveHistory);
                        },
                        height1: 25.h,
                        image: kHistoryIcon,
                        width: 24,
                        height2: 8.h,
                        heading: kActivity,
                        subHeading: kViewRecent),
                    CustomHomeContainer(
                        index: 5,
                        selectedIndex: controller.selectedIndex.value,
                        onPressed: () {
                          controller.changeSelectedIndex(5);
                          Get.toNamed(kNotification);
                        },
                        height1: 26.h,
                        image: kBell,
                        // height2: 5.h,
                        width: 32.w,
                        heading: kNotifications,
                        height3: 2.h,
                        subHeading: kGetAlert),
                  ],
                ),),
                SizedBox(height: 24.h,),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHomeContainer(
                        index: 6,
                        selectedIndex: controller.selectedIndex.value,
                        onPressed: () {
                          controller.changeSelectedIndex(6);
                          Get.toNamed(kSubscriptionPayment);
                        },
                        height1: 25.h,
                        image: kPayment,
                        width: 32.w,
                        heading: kSubsPayment,
                        height3: 5.h,
                        subHeading: kManagePlans),
                    CustomHomeContainer(
                        index: 7,
                        selectedIndex: controller.selectedIndex.value,
                        onPressed: () {
                          controller.changeSelectedIndex(7);
                          Get.toNamed(kSettingPage);
                        },
                        height1: 26.h,
                        image: kSetting,
                        height2: 8.h,
                        width: 30.w,
                        heading: kSettings,
                        height3: 5.h,
                        subHeading: kChangeParental),
                  ],
                ),),
                SizedBox(height: 32.h,),
                
                
            
            
            
            
              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}
