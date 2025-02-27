import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supakids/utils/app_styles.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/back_button.dart';
import '../../../../custom_widgets/custom_button.dart';
import 'package:get/get.dart';
class SignupSuccessScreen extends StatelessWidget {
  const SignupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: AppStyles.height(context),
        width: AppStyles.width(context),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kLightRedColor, kDarkRedColor ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 63.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.h),
                child: const BackButtonWidget(),
              ),
              SizedBox(height: 69.h,),
              Center(
                child: Container(
                  height: 98.h,
                  width: 98.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kWhiteColor,
                  ),
                  child: Icon(Icons.check, size: 30.w, color: kCheckColor,),
                ),
              ),
              SizedBox(height: 37.h,),
              Center(child: Text(kSuccessful, style: AppStyles.interStyle(kWhiteColor, 24, FontWeight.w800),)),
              SizedBox(height: 6.h,),
              Center(child: Text(
                textAlign: TextAlign.center,
                kCongratulations, style: AppStyles.interStyle(kWhiteColor, 14, FontWeight.w400).copyWith(
                height: 1.8
              ),)),
              SizedBox(height: 69.h,),
              CustomButton(
                text: kContinue,
                padding: 0,
                onPressed: () {
                  Get.toNamed(kHome);
                },
              ),





            ],
          ),
        ),
      ),

    );
  }
}
