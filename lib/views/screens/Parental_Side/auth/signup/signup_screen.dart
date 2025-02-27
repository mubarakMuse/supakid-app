import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/common_code.dart';
import 'package:supakids/views/screens/Parental_Side/auth/signup/controller/signup_controller.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/custom_button.dart';
import '../../../../custom_widgets/loading.dart';

class SignupScreen extends GetView<SignupController>{
  const SignupScreen({super.key});

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
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: AppStyles.height(context) / 1.35,
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
                          padding:  EdgeInsets.symmetric(horizontal: 30.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 74.h,),
                              Text(kCreateAcc, style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w800),),
                              SizedBox(height: 5.h,),
                              Text(kSignupToGet, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                              SizedBox(height: 50.h,),
                              Text(kMobile, style: AppStyles.interStyle(kGreyColor, 12, FontWeight.w400),),
                              SizedBox(height: 5.h,),
                              Obx(() =>  TextField(
                                controller: controller.emailController,
                                decoration: InputDecoration(
                                  hintText: kEnterEmail,
                                  errorText: controller.emailError.value.isNotEmpty ? controller.emailError.value : null,
                                ),
                                style: AppStyles.interStyle(kHintTextColor, 16, FontWeight.w400),
                              ),),
                              SizedBox(height: 17.h),
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
                              SizedBox(height: 31.h),
                            ],
                          ),
                        ),
                        CustomButton(
                          text: kSigningUp,
                          onPressed: () {
                            controller.validateFields();
                            if (controller.emailError.isNotEmpty ||
                                controller.passwordError.isNotEmpty ||
                                controller.confirmPasswordError.isNotEmpty
                            ) {
                              showToast(context, msg: kToast, duration: 2);
                            }else{
                              Get.toNamed(kForgotPassword);
                            }

                          },
                          showIcon: false,
                        ),
                        SizedBox(height: 20.h,),
                        Center(child: GestureDetector(
                            onTap: () => Get.back(),
                            child: Text(kBackLogin, style: AppStyles.interStyle(kRedColor, 12, FontWeight.w400),))),
                        SizedBox(height: 50.h,),
                        SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                      ],
                    ),
                  ),
                )),
            Positioned(
                top: 80,
                right: 25,
                child: Image.asset(kPencil, width: 321,)),
          ],
        ),


      ),
    );

  }

}


