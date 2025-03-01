import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/common_code.dart';
import 'package:supakids/views/screens/Parental_Side/auth/set_new_Password/controller/set_password_controller.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/back_button.dart';
import '../../../../custom_widgets/custom_button.dart';
import '../../../../custom_widgets/loading.dart';


class NewPasswordScreen extends GetView<SetPasswordController>{
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => CommonCode.unFocus(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              width: AppStyles.width(context),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [kLightRedColor, kDarkRedColor ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 63.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.h),
                    child: const BackButtonWidget(),
                  ),

                ],
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: AppStyles.height(context) / 1.18,
                  width: AppStyles.width(context),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                      ),
                      image: DecorationImage(image: AssetImage(kBg),fit: BoxFit.cover)
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 28.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 28.h,),
                              Text(kSetPassword, style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w800),),
                              SizedBox(height: 3.h,),
                              Text(kEnsureIt, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400).copyWith(
                                height: 1.8,
                              ),),
                              SizedBox(height: 27.h,),
                              Text(kPassword, style: AppStyles.interStyle(kGreyColor, 12, FontWeight.w400)),
                              SizedBox(height: 5.h),
                              Obx(() => TextField(
                                controller: controller.passwordController,
                                obscureText: !controller.isPasswordVisible.value,
                                obscuringCharacter: kObscure,
                                decoration: InputDecoration(
                                  hintText: kEnterPass,
                                  errorText: controller.passwordError.value.isNotEmpty ? controller.passwordError.value : null,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      controller.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                                      color: kSuffixColor,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                                    },
                                  ),
                                ),
                                style: AppStyles.interStyle(kHintTextColor, 16, FontWeight.w400),
                              ),),
                              SizedBox(height: 17.h),
                              Text(kConfirmPass, style: AppStyles.interStyle(kGreyColor, 12, FontWeight.w400)),
                              Obx(() => TextField(
                                controller: controller.confirmPasswordController,
                                obscureText: !controller.isConfirmPasswordVisible.value,
                                obscuringCharacter: kObscure,
                                decoration: InputDecoration(
                                  hintText: kEnterConfirmPass,
                                  errorText: controller.confirmPasswordError.value.isNotEmpty ? controller.confirmPasswordError.value : null,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      controller.isConfirmPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                                      color: kSuffixColor,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      controller.isConfirmPasswordVisible.value = !controller.isConfirmPasswordVisible.value;
                                    },
                                  ),
                                ),
                                style: AppStyles.interStyle(kHintTextColor, 16, FontWeight.w400),
                              ),),
                              SizedBox(height: 27.h),


                            ],
                          ),
                        ),
                        CustomButton(
                          text: kConfirm,
                          onPressed: () {
                            controller.validateFields();
                            if (controller.passwordError.isNotEmpty ||
                                controller.confirmPasswordError.isNotEmpty
                            ) {
                              showToast(context, msg: kFieldsToast, duration: 2);
                            }else{
                              Get.toNamed(kSignupSuccessful);
                            }
                          },
                        ),
                        SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                      ],
                    ),
                  ),
                ))
          ],
        ),


      ),
    );

  }

}


