import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/common_code.dart';
import 'package:supakids/utils/helpers/global.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import 'package:supakids/views/custom_widgets/custom_header.dart';
import 'package:supakids/views/services/storage.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/custom_dropdown.dart';
import '../../../../custom_widgets/custom_textfield/custom_textfield.dart';
import '../../../../custom_widgets/expandable_container.dart';
import '../../../../custom_widgets/inerest_container/interest_container.dart';
import 'controller/add_profile_controller.dart';

class AddProfileScreen extends GetView<AddProfileController > {
  const AddProfileScreen({super.key});

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
                        Text(kAddNewProfile, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                        SizedBox(height: 3.h),
                        Text(kCreateNew, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
                        SizedBox(height: 17.h),
                        Text(kChildName, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                        SizedBox(height: 14.h,),
                        Obx(() =>  CustomTextField(
                          fieldController : controller.nameController,
                          errorText: controller.nameError.value.isNotEmpty ? controller.nameError.value : null,
                          hintText: kName,
                        ),),
                        SizedBox(height: 16.h,),
                        Text(kAge, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                        SizedBox(height: 14.h,),
                        Obx(()=> CustomTextField(
                          fieldController : controller.ageController,
                          keyboardType: TextInputType.number,
                          errorText: controller.ageError.value.isNotEmpty ? controller.ageError.value : null,
                          hintText: kYears,
                        ),),
                        SizedBox(height: 16.h,),
                        Text(kContentLanguage, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                        SizedBox(height: 14.h,),
                        CustomDropdown(
                          options: const ["English", "Arabic", "Spanish"],
                          selectedValue: controller.contentLanguage.value.isEmpty
                          ?"English"
                          :controller.contentLanguage.value,
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
                                    color: kRedColor, text: kLearnings),
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
                                    color: kPrimaryColor, text: kArt),
                                SizedBox(width: 8.w,),
                                 CustomInterestContainer(
                                  color: kDarkRedColor, text: kSports,),
                                SizedBox(width: 8.w,),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 21.h,),
                        Text(kGender, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                        SizedBox(height: 14.h,),
                        CustomDropdown(
                          options: const ["Male", "Female", "Other"],
                          selectedValue: controller.selectedGender.value.isEmpty
                              ? 'Male'
                              : controller.selectedGender.value,
                          onChanged: (value) {
                            controller.updateGender(value);
                          },
                        ),
                        SizedBox(height: 30.h,),
                        CustomButton(
                          text: kSaveProfile,
                          onPressed: () async {
                            controller.createProfile(context);
                          },
                          showIcon: false,
                          padding: 0,
                          isLoading: controller.isLoading.value,
                        ),

                        SizedBox(height: 10.h,),
                        Center(
                          child: TextButton(
                            onPressed: () =>  Get.back(),
                            child: Text(kCancel, style: AppStyles.interStyle(kRedColor, 12, FontWeight.w400),),
                          ),
                        ),
                        SizedBox(height: 24.h,),
                      ],
                    ),
                  ),

                ],
              ),
            )
        ),

      ),
    );
    // return  Scaffold(
    //   appBar: AppBar(title: Text('Add Child Profile')),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       children: [
    //         TextField(
    //           controller: controller.nameController,
    //           decoration: InputDecoration(labelText: "Child's Name"),
    //         ),
    //         TextField(
    //           controller: controller.ageController,
    //           decoration: InputDecoration(labelText: "Child's Age"),
    //           keyboardType: TextInputType.number,
    //         ),
    //         TextField(
    //           controller: controller.languageController,
    //           decoration: InputDecoration(labelText: "Language Preference"),
    //         ),
    //         Obx(() => DropdownButton<String>(
    //           value: controller.selectedGender.value,
    //           onChanged: controller.updateGender,
    //           items: ['Male', 'Female']
    //               .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
    //               .toList(),
    //         )),
    //         SizedBox(height: 20),
    //         Obx(() => controller.isLoading.value
    //             ? CircularProgressIndicator()
    //             : ElevatedButton(
    //           onPressed: () => controller.createChildProfile(),
    //           child: Text("Create Profile"),
    //         )),
    //       ],
    //     ),
    //   ),
    // );

  }
}




