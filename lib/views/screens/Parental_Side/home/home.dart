import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';
import '../../../../utils/app_strings.dart';
import '../../../custom_widgets/background_container.dart';
import '../../../custom_widgets/custom_container.dart';
import 'controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

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
                        Text(kParent, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                      ],
                    ),
                    Image.asset(kSupaLogo, width: 125.w,),
                  ],
                ),
                SizedBox(height: 24.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHomeContainer(
                      onPressed: () => Get.toNamed(kChildPro),
                        image: kProfile,
                        heading: kChildProfile,
                        subHeading: kAddEdit),
                    CustomHomeContainer(
                        onPressed: () => Get.toNamed(kContentPrefer),
                        height1: 30.h,
                        image: kPrefer,
                        height2: 3.h,
                        width: 24.w,
                        heading: kContent,
                        height3: 0,
                        subHeading: kSetContent),
                  ],
                ),
                SizedBox(height: 24.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHomeContainer(
                        onPressed: (){},
                      height1: 25.h,
                        image: kMobIcon,
                        width: 19,
                        heading: kScreenTime,
                        subHeading: kViewRecent),
                    CustomHomeContainer(
                        onPressed: (){},
                        height1: 26.h,
                        image: kYoutube,
                        height2: 3.h,
                        width: 36.w,
                        heading: kPlaylist,
                        height3: 0,
                        subHeading: kManage),
                  ],
                ),
                SizedBox(height: 24.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHomeContainer(
                        onPressed: (){},
                        height1: 25.h,
                        image: kMobIcon,
                        width: 19,
                        heading: kActivity,
                        subHeading: kViewRecent),
                    CustomHomeContainer(
                        onPressed: (){},
                        height1: 26.h,
                        image: kBell,
                        // height2: 5.h,
                        width: 32.w,
                        heading: kNotifications,
                        height3: 2.h,
                        subHeading: kGetAlert),
                  ],
                ),
                SizedBox(height: 24.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHomeContainer(
                        onPressed: (){},
                        height1: 25.h,
                        image: kPayment,
                        width: 32.w,
                        heading: kSubsPayment,
                        height3: 5.h,
                        subHeading: kManagePlans),
                    CustomHomeContainer(
                        onPressed: (){},
                        height1: 26.h,
                        image: kSetting,
                        height2: 8.h,
                        width: 30.w,
                        heading: kSettings,
                        height3: 5.h,
                        subHeading: kChangeParental),
                  ],
                ),
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
