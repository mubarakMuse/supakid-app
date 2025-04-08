import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_header.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../custom_widgets/content_card.dart';
import 'controller/screen_time_controller.dart';


class ScreenTime extends GetView<ScreenTimeController> {
  const ScreenTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h,),
                  const CustomHeader(),
                  SizedBox(height: 15.h,),
                  Text(kSetTimeFor, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800).copyWith(
                      height: 1.5
                  )),
                  SizedBox(height: 3.h),
                  Text(kClickLimits, style: AppStyles.interStyle(kMidGreyColor, 14 , FontWeight.w400)),
                  SizedBox(height: 31.h),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (controller.childProfiles.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: AppStyles.height(context) * 0.2),
                          Image.asset(kNoChildIcon, color: kPrimaryColor, width: 70.w),
                          SizedBox(height: 11.h),
                          Center(
                            child: Text(kNoProfile, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w600),),
                          ),
                          SizedBox(height: 11.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(kClickOn, style: AppStyles.interStyle(kBlackColor, 12, FontWeight.w600),),
                              Image.asset(kAdd, width: 16.w),
                              Text(kOnRight, style: AppStyles.interStyle(kBlackColor, 12, FontWeight.w600),),
                            ],
                          )
                        ],
                      );
                    }
                    return Wrap(
                      runSpacing: 17,
                      children: List.generate(controller.childProfiles.length, (index) {
                        var data = controller.childProfiles[index];
                        return  ContentCard(
                          name: data['name'] ?? "",
                          age: "${data['age'].toString()} Years",
                          favorite: data['interests'].isNotEmpty ? data['interests'].join(', ') : "No interests",
                          screenTime: "${(data['watchLimit'] / 60).toStringAsFixed(1)} $kScreenTimePer",
                          onTap: () => Get.toNamed(kSetScreenTime, arguments: data),

                        );
                      }),
                    );
                  }),


                ],
              ),
            ),
          )
      ),

    );

  }
}




