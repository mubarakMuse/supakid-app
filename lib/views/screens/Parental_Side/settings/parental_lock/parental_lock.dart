import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import 'package:supakids/views/custom_widgets/loading.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/custom_header.dart';
import 'controller/parental_lock_controller.dart';


class ParentalLockScreen extends GetView<ParentalLockController> {
  const ParentalLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded  (
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 60.h,),
                        const CustomHeader(),
                        SizedBox(height: 30.h),
                        Image.asset(
                          kPinLogo,
                          width: 146.w,
                        ),
                        SizedBox(height: 22.h),
                        Text(kSetPin, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800),),
                        SizedBox(height: 8.h,),
                        Text(kEnterNumbers, style: AppStyles.interStyle(kDarGreyColor, 14, FontWeight.w400),),
                        SizedBox(height: 27.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 40.0.w),
                          child: PinCodeTextField(
                            length: 6,
                            obscureText: true,
                            obscuringCharacter: "*",
                            animationType: AnimationType.fade,
                            keyboardType: TextInputType.number,
                            cursorColor: kPrimaryColor,
                            autoFocus: true,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.circle,
                              fieldHeight: 30.h,
                              fieldWidth: 30.w,
                              inactiveColor: kMidGreyColor,
                              activeColor:  kMidGreyColor,
                              selectedColor: kPrimaryColor,
                              inactiveFillColor: kTransparentColor,
                              activeFillColor: kTransparentColor,
                              selectedFillColor: kTransparentColor,
                            ),
                            animationDuration: const Duration(milliseconds: 300),
                            enableActiveFill: false,
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kBlackColor,
                            ),
                            onCompleted: (v) {
                              print("Completed");
                            },
                            onChanged: (value) {},
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              return true;
                            },
                            appContext: context,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    CustomButton(
                      text: kSaveSettings,
                      onPressed: () {
                        Get.back();
                        showToast(context, msg: kParentalLockSuccess, duration: 2);
                      },
                      showIcon: false,
                      padding: 0,
                    ),
                    SizedBox(height: 40.h,),
                  ],
                ),

              ],
            ),
          )
      ),

    );

  }
}




