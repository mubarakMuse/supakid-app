import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/custom_search_field.dart';
import '../../../../utils/app_strings.dart';
import '../../../custom_widgets/background_container.dart';
import '../../../custom_widgets/shadow_card.dart';
import '../../../custom_widgets/small_button.dart';
import 'controller/subscription_controller.dart';


class SubscriptionManagementScreen extends GetView<SubscriptionManagementController> {
  const SubscriptionManagementScreen({super.key});

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
                Center(child: Image.asset(kSupaLogo, width: 125.w,)),
                SizedBox(height: 15.h,),
                Text(kSubManagement, style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w800),),
                SizedBox(height: 3.h,),
                Text(kUsersPlan, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400),),
                SizedBox(height: 20.h,),
               const CustomSearchField(text: kSearch),
                SizedBox(height: 33.h),
                Obx(() => Column(
                  children: List.generate(controller.videosTitles.length, (index) {
                    var data = controller.videosTitles[index];
                    return Padding(
                      padding:  EdgeInsets.only(bottom: 30.0.h),
                      child: ShadowCard(
                          child: Padding(
                            padding:  EdgeInsets.only(bottom:18.h, top: 32.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 22.0.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(kChildIcon, width: 18.w),
                                        SizedBox(width: 13.w),
                                        Text(data['name'] ?? "", style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400)),
                                      ],
                                    ),
                                    SizedBox(height: 11.h),
                                    Row(
                                      children: [
                                        Image.asset(kEmailIcon, width: 19.w, color: kPrimaryColor),
                                        SizedBox(width: 15.w),
                                        Text(data['email'] ?? "", style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400)),
                                      ],
                                    ),
                                    SizedBox(height: 11.h),
                                    Row(
                                      children: [
                                        Image.asset(kChildrenIcon, width: 20.w),
                                        SizedBox(width: 12.w),
                                        Text('Upto 3 Child Profiles', style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400)),
                                      ],
                                    ),
                                    SizedBox(height: 11.h),
                                    Row(
                                      children: [
                                        Image.asset(kPlaneIcon, width: 20.w, color: kPrimaryColor,),
                                        SizedBox(width: 12.w),
                                        Text('Plan Type', style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400)),
                                      ],
                                    ),
                                    SizedBox(height: 11.h),
                                    Row(
                                      children: [
                                        Image.asset(kMoneyIcon, width: 22.w, color: kPrimaryColor,),
                                        SizedBox(width: 10.w),
                                        Text('\$4.99/month', style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400)),
                                      ],
                                    ),
                                    SizedBox(height: 11.h),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(left: 1.w),
                                          child: Image.asset(kBillingIcon, width: 18.w, color: kPrimaryColor,),
                                        ),
                                        SizedBox(width: 13.w),
                                        Text('Next Billing: Sep 15, 2024', style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400)),
                                      ],
                                    ),
                                    SizedBox(height: 11.h),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(left: 1.w),
                                          child: Image.asset(kActiveIcon, width: 19.w),
                                        ),
                                        SizedBox(width: 11.w),
                                        Text('Active', style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400)),
                                      ],
                                    ),
                                    SizedBox(height: 21.h,),
                                  ],
                                ),
                              ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SmallButton(
                                            onTap: () {},
                                            text: kUpgrade,
                                            sizeWidth: 4.h,
                                            bgColor: kGreenColor,
                                            image: kUpgradeIcon,
                                            imageSize: 15.w,
                                          ),
                                          SmallButton(
                                            onTap: () {},
                                            width:  AppStyles.width(context)/ 4.3.w,
                                            text: kDowngrade,
                                            sizeWidth: 2.h,
                                            image: kDowngradeIcon,
                                            imageSize: 15.w,
                                          ),
                                          SmallButton(
                                            onTap: (){},
                                            text: kCancel,
                                            sizeWidth: 4.h,
                                            bgColor: kRedColor,
                                            image: kCancelIcon,
                                            imageSize: 17.w,
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    );
                  }),
                )),
              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}
