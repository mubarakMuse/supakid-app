import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/screens/Parental_Side/home/child_Profile/all_profiles/controller/all_profiles_controller.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../../custom_widgets/back_button.dart';

class AllProfilesScreen extends GetView<AllProfilesController> {
  const AllProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h,),
                  Row(
                    children: [
                      const BackButtonWidget(),
                      Expanded(
                        child: Center(
                          child: Image.asset(kSupaLogo, width: 125.w),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(kAddPro),
                        child: Row(
                          children: [
                            Image.asset(kAdd, width: 16.w),
                            SizedBox(width: 4.w),
                            Text(kAddNew, style: AppStyles.interStyle(kPrimaryColor, 10, FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h,),
                 Text(kManageProfiles, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                  SizedBox(height: 3.h),
                 Text(kCustomizeEach, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
                  SizedBox(height: 22.h),
                  Obx(() {
                    return Wrap(
                      children: controller.profiles.map((profiles) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 346.h,
                              width: AppStyles.width(context),
                              decoration: BoxDecoration(
                                color: kCardColor,
                                borderRadius: BorderRadius.circular(28),
                                boxShadow: [
                                  BoxShadow(
                                    color: kBlackColor.withOpacity(0.2),
                                    blurRadius: 8,
                                    spreadRadius: 0,
                                    offset: const Offset(1, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20.h),
                                    Text(kProfileList, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                                    SizedBox(height: 10.h),
                                    Text(kProfileName, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
                                    SizedBox(height: 10.h),
                                    Text(profiles['name'] ?? "", style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
                                    SizedBox(height: 12.h),
                                    const Divider(color: kRedColor, height: 2, thickness: 2),
                                    SizedBox(height: 12.h),
                                    Text(profiles['age'] ?? "", style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
                                    SizedBox(height: 10.h),
                                    Text(kYears, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
                                    SizedBox(height: 12.h),
                                    const Divider(color: kRedColor, height: 2, thickness: 2),
                                    SizedBox(height: 12.h),
                                    Text(kInterest, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
                                    SizedBox(height: 8.h),
                                    Text(profiles['interest'] ?? "", style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
                                    SizedBox(height: 13.h),
                                    GestureDetector(
                                      onTap: () => Get.toNamed(kEditPro),
                                      child: Container(
                                        height: 37,
                                        width: AppStyles.width(context) * 0.22,
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(kEditIcon, width: 12.w),
                                              Text(kEdit, style: AppStyles.interStyle(kWhiteColor, 14, FontWeight.w700)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 22.h),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 27.h),
                          ],
                        );
                      }).toList(),
                    );
                  }),



              ],
              ),
            ),
          )
      ),
    );
  }
}
