import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/common_code.dart';
import 'package:supakids/views/screens/Parental_Side/auth/forgot_Password/Controller/forgotPassword_controller.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/custom_button.dart';
import '../../../../custom_widgets/loading.dart';


class ForgotPasswordScreen extends GetView<ForgotPasswordController>{
  const ForgotPasswordScreen({super.key});

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
                    padding:  EdgeInsets.symmetric(horizontal: 24.0.h),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Image.asset(kBackIcon, width: 23.w,)),
                      ),
                    ),
                  )
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
                              Text(kForgotPasswords, style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w800),),
                              SizedBox(height: 3.h,),
                              Text(kPleaseEnterID, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400),),
                              SizedBox(height: 52.h,),
                              Text(kUserID, style: AppStyles.interStyle(kGreyColor, 12, FontWeight.w400),),
                              SizedBox(height: 5.h,),
                              Obx(() =>  TextField(
                                controller: controller.userIdController,
                                decoration: InputDecoration(
                                  hintText: kEnterUserID,
                                  errorText: controller.emailError.value.isNotEmpty ? controller.emailError.value : null,
                                ),
                                style: AppStyles.interStyle(kHintTextColor, 16, FontWeight.w400),
                              ),
                              ),
                              SizedBox(height: 55.h),
                            ],
                          ),
                        ),
                        CustomButton(
                          text: kResetPassword,
                          onPressed: () {
                            controller.validateFields();
                            if (controller.emailError.isNotEmpty) {
                              showToast(context, msg: kToast, duration: 2);
                            }else{
                              Get.toNamed(kOtp);
                            }
                          },
                          // showIcon: true,
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


