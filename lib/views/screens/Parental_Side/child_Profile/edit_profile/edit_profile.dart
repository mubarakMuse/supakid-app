import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/common_code.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import 'package:supakids/views/custom_widgets/custom_header.dart';
import 'package:supakids/views/custom_widgets/loading.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/custom_dropdown.dart';
import '../../../../custom_widgets/custom_textfield/custom_textfield.dart';
import '../../../../custom_widgets/expandable_container.dart';
import '../../../../custom_widgets/custom_tile.dart';
import '../../../../custom_widgets/inerest_container/interest_container.dart';
import 'controller/edit_child_profiles_controller.dart';

class EditProfilesScreen extends GetView<EditProfileController> {
  const EditProfilesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CommonCode.unFocus(context),
      child: Scaffold(
        body: BackgroundContainer(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60.h,),
                       const CustomHeader(),
                        SizedBox(height: 15.h,),
                        Text("$kEditProfile ${controller.data['name']}", style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                        SizedBox(height: 3.h),
                        Text(kUpdateInfo, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
                        SizedBox(height: 17.h),
                        Text(kChildName, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                        SizedBox(height: 14.h,),
                        CustomTextField(
                          fieldController : controller.nameController,
                          hintText: kName,
                        ),
                        SizedBox(height: 16.h,),
                        Text(kAge, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                        SizedBox(height: 14.h,),
                        CustomTextField(
                          keyboardType: TextInputType.number,
                          fieldController : controller.ageController,
                          hintText: kYears,
                        ),
                        SizedBox(height: 16.h,),
                        Text(kContentLanguage, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                        SizedBox(height: 14.h,),
                        CustomDropdown(
                          options: const ["English", "Arabic", "Spanish"],
                          selectedValue: controller.contentLanguage.value.isEmpty
                              ?"English"
                              : controller.contentLanguage.value,
                          onChanged: (value) {
                            controller.updateContentLanguage(value);
                          },
                        ),
                        SizedBox(height: 16.h,),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      ExpandableContainer(
                        isExpanded: controller.isExpanded,
                        onToggle: controller.toggleExpansion,
                        title: kInterests,
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
                        ],
                      ),
                      SizedBox(height: 21.h,),
                      Text(kGender, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                      SizedBox(height: 14.h,),
                      CustomDropdown(
                        options: const ["Male", "Female", "Other"],
                        selectedValue: controller.selectedGender.value,
                        onChanged: (value) {
                          controller.updateGender(value);
                        },
                      ),
                      SizedBox(height: 18.h,),
                      // CustomTile(
                      //   label: kRestrict,
                      //   switchValue: controller.isSwitch1,
                      //   onToggle: controller.switchToggle1,
                      // ),
                      // SizedBox(height: 12.h,),
                      // CustomTile(
                      //   label: kOnlyAllow,
                      //   switchValue: controller.isSwitch2,
                      //   onToggle: controller.switchToggle2,
                      // ),
                      // SizedBox(height: 12.h,),
                      CustomTile(
                        label: kDelete,
                        imagePath: kDelIcon,
                        rightPadding: 20.w,
                        onTap: () {
                          showCustomDialog(
                            title: kDelProfile,
                            middleText: kSureToDel,
                            onConfirm: () {
                              controller.deleteProfile(context);
                            },
                          );
                        },
                      ),
                      SizedBox(height: 33.h,),
                      CustomButton(
                        text: kSave,
                        onPressed: () {
                         controller.updateProfile(context);
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
                    ],),
                  )
                ],
              ),
            )
        ),

      ),
    );

  }
}




