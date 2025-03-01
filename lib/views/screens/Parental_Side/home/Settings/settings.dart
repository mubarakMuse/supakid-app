import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import 'package:supakids/views/custom_widgets/loading.dart';
import 'package:supakids/views/custom_widgets/shadow_card.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/back_button.dart';
import '../../../../custom_widgets/custom_tile.dart';
import 'controller/settings_controller.dart';


class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

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
                        SizedBox(height: 15.h,),
                        Text(kAccountSettings, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                        SizedBox(height: 3.h),
                        Text(kManageSecurity, style: AppStyles.interStyle(kMidGreyColor, 14 , FontWeight.w400)),
                        SizedBox(height: 21.h),
                        ShadowCard(
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
                              child: CustomTile(
                                onTap: () => Get.toNamed(kChangePassword),
                                label: kChangePasswords,
                                bgColor: kPrimaryColor,
                               ),
                            )),
                        SizedBox(height: 14.h,),
                        ShadowCard(
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
                              child: CustomTile(
                                onTap: () => Get.toNamed(kChangeLanguage),
                                label: kChangeLang,
                                bgColor: kPrimaryColor,
                              ),
                            )),
                        SizedBox(height: 14.h,),
                        ShadowCard(
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
                              child: CustomTile(
                                label: kEnableLock,
                                bgColor: kPrimaryColor,
                                switchColor: kPrimaryColor,
                                switchValue: controller.isSwitch,
                                onToggle: controller.switchToggle,

                              ),
                            )),
                        SizedBox(height: 14.h,),
                        ShadowCard(
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
                              child: CustomTile(
                                onTap: (){},
                                label: kContactSupport,
                                bgColor: kPrimaryColor,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    CustomButton(
                      text: kSavedSettings,
                      onPressed: () {
                        Get.back();
                        showToast(context, msg: kSettingsSuccess, duration: 2);
                      },
                      showIcon: false,
                      padding: 0,
                    ),
                    SizedBox(height: 49.h,),
                  ],
                )
              ],
            ),
          )
      ),

    );

  }
}




