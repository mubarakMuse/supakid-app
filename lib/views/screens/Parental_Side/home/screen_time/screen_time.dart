import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/back_button.dart';
import '../../../../custom_widgets/hour_selected_card.dart';
import '../../../../custom_widgets/loading.dart';
import '../../../../custom_widgets/shadow_card.dart';
import '../../../../custom_widgets/custom_tile.dart';
import 'controller/screen_time_controller.dart';


class ScreenTime extends GetView<ScreenTimeController> {
  const ScreenTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BackButtonWidget(),
                            Expanded(
                              child: Center(
                                child: Image.asset(
                                  kSupaLogo,
                                  width: 125.w,
                                ),
                              ),
                            ),
                            SizedBox(width: 50.w),
                          ],
                        ),
                        SizedBox(height: 15.h,),
                        Text(kSetTime, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800).copyWith(
                            height: 1.5
                        )),
                        SizedBox(height: 3.h),
                        Text(kHowControl, style: AppStyles.interStyle(kMidGreyColor, 14 , FontWeight.w400)),
                        SizedBox(height: 31.h),
                        HourSelectorCard(
                          title: kSetLimits,
                          hours: controller.hours,
                          onIncrement: controller.incrementHour,
                          onDecrement: controller.decrementHour,
                        ),
                        SizedBox(height: 33.h,),
                        Text(kExtraSetting, style: AppStyles.interStyle(kBlackColor, 20 , FontWeight.w800)),
                        SizedBox(height: 15.h,),
                        ShadowCard(
                          height: AppStyles.height(context) / 9.2,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
                            child: Column(
                              children: [
                                CustomTile(
                                  bgColor: kPrimaryColor,
                                  label: kBlockContent,
                                  switchColor: kPrimaryColor,
                                  switchValue: controller.isSwitch1,
                                  onToggle: controller.switchToggle1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        ShadowCard(
                          height: AppStyles.height(context) / 9.2,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
                            child: Column(
                              children: [
                                CustomTile(
                                  bgColor: kPrimaryColor,
                                  label: kBlockContent,
                                  switchColor: kPrimaryColor,
                                  switchValue: controller.isSwitch2,
                                  onToggle: controller.switchToggle2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(height: 41.h,),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    CustomButton(
                      text: kSaveLimit,
                      onPressed: () {
                        Get.back();
                        showToast(context, msg: kSavedTime);
                      },
                      showIcon: false,
                      padding: 0,
                    ),
                    SizedBox(height: 10.h,),
                    Center(
                      child: TextButton(
                        onPressed:controller.resetToDefault,
                        child: Text(kResetDefault, style: AppStyles.interStyle(kRedColor, 12, FontWeight.w400),),
                      ),
                    ),
                    SizedBox(height: 55.h,),
                  ],
                )
              ],
            ),
          )
      ),

    );

  }
}




