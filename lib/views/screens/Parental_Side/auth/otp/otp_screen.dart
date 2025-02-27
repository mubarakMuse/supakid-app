import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/common_code.dart';
import 'package:supakids/views/screens/Parental_Side/auth/otp/Controller/opt_controller.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/custom_button.dart';
import '../../../../custom_widgets/loading.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends GetView<OtpController>{
  const OtpScreen({super.key});

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
                              Text(kEnterOtp, style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w800),),
                              SizedBox(height: 3.h,),
                              Text(kEnterYourOtp, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400),),
                              SizedBox(height: 32.h,),
                              Obx(() => OtpTextField(
                                numberOfFields: 5,
                                borderRadius: BorderRadius.circular(12),
                                showFieldAsBox: true,
                                borderColor:  kOtpBorderColor,
                                focusedBorderColor: controller.isOtpInvalid.value ? kRedColor : kPrimaryColor,
                                enabledBorderColor: controller.isOtpInvalid.value ? kRedColor : kDarkGrey,
                                fieldWidth: 46,
                                fieldHeight: 46,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                textStyle: AppStyles.interStyle(kBlackColor, 16, FontWeight.w400 ),
                                onCodeChanged: (String code) {
                                  controller.otpCode.value = code;
                                  controller.isOtpInvalid.value = false;
                                },
                                onSubmit: (String verificationCode) {
                                  controller.otpCode.value = verificationCode;
                                  controller.isOtpInvalid.value = false;
                                },
                              )),
                              Obx(() => controller.otpError.value.isNotEmpty
                                  ? Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.otpError.value,
                                  style: AppStyles.interStyle(kRedColor, 16, FontWeight.w400),
                                ),
                              )
                                  : const SizedBox.shrink(),
                              ),
                              SizedBox(height: 39.h),
                            ],
                          ),
                        ),
                        CustomButton(
                          text: kVerifyCode,
                          onPressed: () {
                            controller.validateFields();
                            if (controller.otpError.isNotEmpty) {
                              showToast(context, msg: kPleaseEnterOtp, duration: 2);
                            } else {
                              Get.toNamed(kResetPass);
                            }
                          },
                        ),
                        SizedBox(height: 27.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              kOtpYet,
                              style: AppStyles.interStyle(kDarkGrey , 14, FontWeight.w600),
                            ),
                            SizedBox(width: 5.w,),
                            Text(
                              kResendOtp,
                              style: AppStyles.interStyle(kRedColor, 14, FontWeight.w600).copyWith(
                                decoration: TextDecoration.underline
                              ),
                            ),
                          ],
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


