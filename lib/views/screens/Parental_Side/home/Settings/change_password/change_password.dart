import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/common_code.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import 'package:supakids/views/custom_widgets/loading.dart';
import 'package:supakids/views/screens/Parental_Side/home/Settings/change_password/controller/change_password_controller.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../../custom_widgets/back_button.dart';
import '../../../../../custom_widgets/custom_textfield.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController > {
  const ChangePasswordScreen({super.key});

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
                    SizedBox(height: 15.h,),
                    Text(kUpdateAcc, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                    SizedBox(height: 29.h),
                    Text(kChangePasswords, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                    SizedBox(height: 14.h,),
                   Obx(() =>  CustomTextField(
                     controller : controller.currentPasswordController,
                     errorText: controller.currentPassError.value.isNotEmpty ? controller.currentPassError.value : null,
                     hintText: kTextInput,
                   ),),
                    SizedBox(height: 16.h,),
                    Text(kNewPassword , style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                    SizedBox(height: 14.h,),
                    Obx(()=> CustomTextField(
                      controller : controller.newPasswordController,
                      errorText: controller.newPassError.value.isNotEmpty ? controller.newPassError.value : null,
                      hintText: kTextInput,
                    ),),
                    SizedBox(height: 16.h,),
                    Text(kConfirmPass, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                    SizedBox(height: 14.h,),
                    CustomTextField(
                      controller : controller.confirmPasswordController,
                      errorText: controller.confirmPassError.value.isNotEmpty ? controller.confirmPassError .value : null,
                      hintText: kTextInput,
                    ),
                    SizedBox(height: 216.h,),
                    CustomButton(
                      text: kSaveNewPassword,
                      onPressed: () {
                        controller.validateFields();
                        if (controller.currentPassError.value.isEmpty
                            || controller.newPassError.value.isEmpty
                        ||  controller.confirmPassError.value.isEmpty
                        ) {
                          showToast(context, msg: kPasswordSaved);
                          Get.back();
                        }
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




