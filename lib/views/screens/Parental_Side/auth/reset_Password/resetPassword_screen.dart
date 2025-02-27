import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/common_code.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/back_button.dart';
import '../../../../custom_widgets/custom_button.dart';


class ResetPasswordScreen extends StatelessWidget{
  const ResetPasswordScreen({super.key});

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
                              Text(kPasswordReset, style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w800),),
                              SizedBox(height: 3.h,),
                              Text(kSetNew, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400),),
                              SizedBox(height: 43.h,),

                            ],
                          ),
                        ),
                        CustomButton(
                          text: kConfirm,
                          onPressed: () {
                            Get.toNamed(kSetNewPass);
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


