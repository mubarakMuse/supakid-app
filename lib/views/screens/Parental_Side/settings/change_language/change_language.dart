import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/loading.dart';
import 'package:supakids/views/custom_widgets/shadow_card.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/back_button.dart';
import '../../../../custom_widgets/custom_button.dart';
import '../../../../custom_widgets/custom_tile.dart';
import 'controller/change_language_controller.dart';



class ChangeLanguageScreen extends GetView<ChangeLanguageController> {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
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
                        SizedBox(height: 10.h,),
                        Text(kSelectLang, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                        SizedBox(height: 23.h),
                        ShadowCard(
                          child: Padding(
                            padding:  EdgeInsets.only(left: 22.0.w, top: 15.h, bottom: 25.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(kAvailableLang, style: AppStyles.interStyle(kBlackColor, 16, FontWeight.w800)),
                                SizedBox(height: 12.h,),
                                CustomTile(
                                  leftPadding: 0,
                                    rightPadding: 0,
                                    height: AppStyles.height(context) * 0.04.h,
                                    switchValue: controller.isSwitch1,
                                    onToggle: controller.switchToggle1,
                                    bgColor: kTransparentColor,
                                    switchColor: kWhiteColor,
                                    label: kEnglish,
                                  textColor: kBlackColor,
                                  activeColor: kPrimaryColor,
                                  inactiveColor: kInactiveColor,
                                ),
                                SizedBox(height: 6.h,),
                                CustomTile(
                                  leftPadding: 0,
                                    rightPadding: 0,
                                    height: AppStyles.height(context) * 0.04.h,
                                    switchValue: controller.isSwitch2,
                                    onToggle: controller.switchToggle2,
                                    bgColor: kTransparentColor,
                                    switchColor: kWhiteColor,
                                    label: kSpanish,
                                  textColor: kBlackColor,
                                  activeColor: kPrimaryColor,
                                  inactiveColor: kInactiveColor,
                                ),
                                SizedBox(height: 6.h,),
                                CustomTile(
                                  leftPadding: 0,
                                  rightPadding: 0,
                                  height: AppStyles.height(context) * 0.04.h,
                                  switchValue: controller.isSwitch3,
                                  onToggle: controller.switchToggle3,
                                  bgColor: kTransparentColor,
                                  switchColor: kWhiteColor,
                                  label: kArabic,
                                  textColor: kBlackColor,
                                  activeColor: kPrimaryColor,
                                  inactiveColor: kInactiveColor,
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    CustomButton(
                      text: kSaving,
                      onPressed: () {
                        Get.back();
                        showToast(context, msg: kLangSuccess, duration: 2);
                      },
                      showIcon: false,
                      padding: 0,
                    ),
                    SizedBox(height: 13.h,),
                    Center(
                      child: TextButton(
                          onPressed: () => Get.back(),
                          child: Text(kCancel, style: AppStyles.interStyle(kRedColor, 12, FontWeight.w400),)
                      ),
                    ),
                    SizedBox(height: 33.h,),

                  ],
                )
              ],
            ),
          )
      ),

    );

  }
}




