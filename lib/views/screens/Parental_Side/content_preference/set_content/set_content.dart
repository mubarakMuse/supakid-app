import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import 'package:supakids/views/custom_widgets/custom_header.dart';
import 'package:supakids/views/custom_widgets/loading.dart';
import 'package:supakids/views/screens/parental_side/content_preference/set_content/controller/set_content_controller.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/custom_tile.dart';
import '../../../../custom_widgets/expandable_container.dart';
import '../../../../custom_widgets/hour_selected_card.dart';
import '../../../../custom_widgets/inerest_container/interest_container.dart';
import '../../../../custom_widgets/shadow_card.dart';


class SetContentScreen extends GetView<SetContentController> {
  const SetContentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 60.h,),
                     const CustomHeader(),
                     SizedBox(height: 15.h,),
                     Text(kCustomizeName, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800).copyWith(
                         height: 1.5
                     )),
                     SizedBox(height: 3.h),
                     Text(kSetRestrictions, style: AppStyles.interStyle(kMidGreyColor, 14 , FontWeight.w400)),
                     SizedBox(height: 20.h),
                   ],
                 ),
               ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpandableContainer(
                        isExpanded: controller.isExpanded,
                        onToggle: controller.toggleExpansion,
                        title: kContentCategory,
                        children: [
                          Row(
                            children: [
                              CustomInterestContainer(
                                color: kRedColor, text: kLearnings, isInitiallySelected: true,),
                              SizedBox(width: 8.w,),
                              CustomInterestContainer(
                                color: kYellowColor, text: kAnimal, textColor: kBlackColor,isInitiallySelected: true,),
                              SizedBox(width: 8.w,),
                              CustomInterestContainer(
                                color: kGreenColor, text: kSpace,isInitiallySelected: true,),
                            ],
                          ),

                          SizedBox(height: 11.h,),
                          Row(
                            children: [
                              CustomInterestContainer(
                                color: kPrimaryColor, text: kArt, isInitiallySelected: true,),
                              SizedBox(width: 8.w,),
                              CustomInterestContainer(
                                color: kDarkRedColor, text: kSports, isInitiallySelected: true,),
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
                        text: kSavePrefer,
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
                )




              ],
            ),
          )
      ),

    );

  }
}




