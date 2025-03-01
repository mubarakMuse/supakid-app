import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/common_code.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import 'package:supakids/views/custom_widgets/interest_container.dart';
import 'package:supakids/views/custom_widgets/loading.dart';
import 'package:supakids/views/screens/Parental_Side/home/content_preference/controller/content_preference_controller.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/back_button.dart';
import '../../../../custom_widgets/expandable_container.dart';
import '../../../../custom_widgets/hour_selected_card.dart';
import '../../../../custom_widgets/shadow_card.dart';
import '../../../../custom_widgets/custom_tile.dart';


class ContentPreferenceScreen extends GetView<ContentPreferenceController> {
  const ContentPreferenceScreen({super.key});

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
                  Text(kCustomize, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800).copyWith(
                    height: 1.5
                  )),
                  SizedBox(height: 3.h),
                  Text(kChoseContent, style: AppStyles.interStyle(kMidGreyColor, 14 , FontWeight.w400)),
                  SizedBox(height: 20.h),
                  ExpandableContainer(
                    isExpanded: controller.isExpanded,
                    onToggle: controller.toggleExpansion,
                    title: kContentCategory,
                    children: [
                      Row(
                        children: [
                          const CustomInterestContainer(
                              color: kRedColor, text: kLearnings),
                          SizedBox(width: 8.w,),
                          const CustomInterestContainer(
                            color: kYellowColor, text: kAnimal, textColor: kBlackColor,),
                          SizedBox(width: 8.w,),
                          const CustomInterestContainer(
                            color: kGreenColor, text: kSpace,),
                        ],
                      ),

                      SizedBox(height: 11.h,),
                      Row(
                        children: [
                          const CustomInterestContainer(
                              color: kPrimaryColor, text: kArt),
                          SizedBox(width: 8.w,),
                          const CustomInterestContainer(
                            color: kDarkRedColor, text: kSports,),
                          SizedBox(width: 8.w,),
                          const CustomInterestContainer(
                            color: kTransparentColor, text: kSports, textColor: kTransparentColor,),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  HourSelectorCard(
                    title: kSetLimits,
                    hours: controller.hours,
                    onIncrement: controller.incrementHour,
                    onDecrement: controller.decrementHour,
                  ),
                  SizedBox(height: 20.h,),
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
                  SizedBox(height: 20.h,),
                  ShadowCard(
                    height: AppStyles.height(context) / 9.2,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
                      child: Column(
                        children: [
                          CustomTile(
                            height: AppStyles.height(context) * 0.083.h,
                            bgColor: kPrimaryColor,
                            label: kReceiveNotify,
                            switchColor: kPrimaryColor,
                            switchValue: controller.isSwitch2,
                            onToggle: controller.switchToggle2,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 52.h,),

                  CustomButton(
                    text: kResetDefault,
                    onPressed: () {
                      Get.back();
                      showToast(context, msg: kSavedPrefer);
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
                  SizedBox(height: 24.h,),
                ],
              ),
            ),
          )
      ),

    );

  }
}




