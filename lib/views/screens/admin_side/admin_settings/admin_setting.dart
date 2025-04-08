import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/loading.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../custom_widgets/background_container.dart';
import '../../../custom_widgets/custom_tile.dart';
import '../../../custom_widgets/shadow_card.dart';

class AdminSettingScreen extends GetView<AdminSettingScreen> {
  const AdminSettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h,),
                Center(child: Image.asset(kSupaLogo, width: 121.w,)),
                SizedBox(height: 15.h,),
                Text(kSettingPrefer, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800),),
                SizedBox(height: 3.h,),
                Text(kManageSec, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                SizedBox(height: 20.h,),
                ShadowCard(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
                      child: CustomTile(
                        onTap: () {},
                        label: kModifyRes,
                        bgColor: kPrimaryColor,
                      ),
                    ),
                ),
                SizedBox(height: 14.h,),
                ShadowCard(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
                    child: CustomTile(
                      onTap: () {},
                      label: kCustomLang,
                      bgColor: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 14.h,),
                ShadowCard(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
                    child: CustomTile(
                      onTap: () {
                        Get.offNamed(kLogin);
                        showToast(context, msg: kLogOutSuccess, duration: 2);
                      },
                      label: kLogOut,
                      bgColor: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}
