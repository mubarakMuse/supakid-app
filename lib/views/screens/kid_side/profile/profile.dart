import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/common_code.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../utils/app_images.dart';
import '../../../custom_widgets/custom_textfield/custom_textfield.dart';
import '../../../custom_widgets/expandable_container.dart';
import '../../../custom_widgets/inerest_container/controller/interest_controller.dart';
import '../../../custom_widgets/inerest_container/interest_container.dart';
import 'controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController > {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CommonCode.unFocus(context),
      child: Scaffold(
        body: BackgroundContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child:    SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  Center(child: Image.asset(kSupaLogo, width: 121.w,)),
                  SizedBox(height: 15.h),
                  Text(kMyProfile, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                  SizedBox(height: 3.h),
                  Text(kHereProfile, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    fieldController: controller.nameController,
                    hintText: kName,
                    readOnly: true,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    fieldController: controller.ageController,
                    readOnly: true,
                    hintText: kYears,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    fieldController: controller.languageController,
                    hintText: kEnglish,
                    readOnly: true,
                  ),
                  SizedBox(height: 27.h),
                  ExpandableContainer(
                    isExpanded: controller.isExpanded,
                    onToggle: controller.toggleExpansion,
                    title: kContent,
                    children: [
                      Row(
                        children: [
                          CustomInterestContainer(
                            color: kRedColor,
                            text: kLearnings,
                          ),
                          SizedBox(width: 8.w,),
                          CustomInterestContainer(
                            color: kYellowColor, text: kAnimal, textColor: kBlackColor,),
                          SizedBox(width: 8.w,),
                          CustomInterestContainer(
                            color: kGreenColor, text: kSpace,),
                        ],
                      ),
                      SizedBox(height: 11.h,),
                      Row(
                          children: [
                            CustomInterestContainer(
                              color: kPrimaryColor, text: kArt,),
                            SizedBox(width: 8.w,),
                            CustomInterestContainer(
                              color: kDarkRedColor, text: kSports,),
                          ]
                      ),
                      // Row(
                      //   children: [
                      //     CustomInterestContainer(color: kRedColor, text: kArtCreate,),
                      //     SizedBox(width: 8.w),
                      //     CustomInterestContainer(color: kYellowColor, text: kDinosaurs, textColor: kBlackColor,),
                      //     SizedBox(width: 8.w),
                      //     CustomInterestContainer(color: kGreenColor, text: kSpacing,),
                      //   ],
                      // ),
                    ],
                  ),


                  SizedBox(height: 50.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}




