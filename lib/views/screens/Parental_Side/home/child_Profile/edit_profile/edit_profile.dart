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
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../../custom_widgets/back_button.dart';
import '../../../../../custom_widgets/custom_textfield.dart';
import '../../../../../custom_widgets/expandable_container.dart';
import '../../../../../custom_widgets/toggle_container.dart';
import 'controller/child_profiles_controller.dart';

class EditProfilesScreen extends GetView<EditProfileController> {
  const EditProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CommonCode.unFocus(context),
      child: Scaffold(
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
                    SizedBox(height: 22.h,),
                    Text(kEditProfile, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                    SizedBox(height: 3.h),
                    Text(kUpdateInfo, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
                    SizedBox(height: 17.h),
                    Text(kChildName, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                    SizedBox(height: 14.h,),
                    CustomTextField(
                       controller : controller.nameController,
                      hintText: kName,
                    ),
                    SizedBox(height: 16.h,),
                    Text(kAge, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                    SizedBox(height: 14.h,),
                    CustomTextField(
                      controller : controller.ageController,
                      hintText: kYears,
                    ),
                    SizedBox(height: 16.h,),
                    Text(kContentLanguage, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                    SizedBox(height: 14.h,),
                    CustomTextField(
                      controller : controller.languageController,
                      hintText: kEnglish,
                    ),
                    SizedBox(height: 16.h,),
                    ExpandableContainer(
                      isExpanded: controller.isExpanded,
                      onToggle: controller.toggleExpansion,
                      title: kInterests,
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

                    SizedBox(height: 21.h,),
                    Text(kGender, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                    SizedBox(height: 14.h,),
                    CustomTextField(
                      controller : controller.genderController,
                      hintText: kMale,
                    ),
                    SizedBox(height: 18.h,),
                    CustomSwitchTile(
                      label: kRestrict,
                      switchValue: controller.isSwitch1,
                      onToggle: controller.switchToggle1,
                    ),
                    SizedBox(height: 12.h,),
                    CustomSwitchTile(
                      label: kOnlyAllow,
                      switchValue: controller.isSwitch2,
                      onToggle: controller.switchToggle2,
                    ),
                    SizedBox(height: 12.h,),
                    CustomSwitchTile(
                      label: kDelete,
                      imagePath: kDelIcon,
                      padding: 20.w,
                    ),
                    SizedBox(height: 33.h,),
                    CustomButton(
                        text: kSave,
                        onPressed: () {
                          Get.back();
                          showToast(context, msg: kChangeSaved,);
                        },
                      showIcon: false,
                      padding: 0,
                    ),
                    SizedBox(height: 10.h,),
                    Center(
                      child: TextButton(
                        onPressed: () =>  Get.back(),
                        child: Text(kCancel, style: AppStyles.interStyle(kRedColor, 12, FontWeight.w400),),
                      ),
                    ),
                    SizedBox(height: 33.h,),
                  ],
                ),
              ),
            )
        ),

      ),
    );

  }
}




