import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import 'package:supakids/views/custom_widgets/shadow_card.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/back_button.dart';
import '../../../../custom_widgets/custom_tile.dart';
import 'controller/subscription_payment_controller.dart';


class SubscriptionPaymentScreen extends GetView<SubscriptionPaymentController> {
  const SubscriptionPaymentScreen({super.key});

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
                  SizedBox(height: 22.h,),
                  Text(kManageSubs, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                  SizedBox(height: 3.h),
                  Text(kUpgradeCancel, style: AppStyles.interStyle(kMidGreyColor, 14 , FontWeight.w400)),
                  SizedBox(height: 21.h),
                  ShadowCard(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(kCurrentPlane, style: AppStyles.interStyle(kBlackColor, 16, FontWeight.w800)),
                          SizedBox(height: 16.h,),
                          Row(
                            children: [
                              Image.asset(kPremiumIcon, width: 14.w, color: kPrimaryColor,),
                              SizedBox(width: 5.w,),
                              Text(kPremium, style: AppStyles.interStyle(kPrimaryColor, 12 , FontWeight.w800)),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Text(kBilling, style: AppStyles.interStyle(kMidGreyColor, 14 , FontWeight.w400)),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Image.asset(kBillIcon, width: 16.w, color: kPrimaryColor,),
                              SizedBox(width: 5.w,),
                              Text(kNextBillingDate, style: AppStyles.interStyle(kPrimaryColor, 14 , FontWeight.w800)),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Text(kNextBilling, style: AppStyles.interStyle(kMidGreyColor, 14 , FontWeight.w400)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 23.h,),
                  ShadowCard(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
                        child: CustomTile(
                          label: kChangePlane,
                          bgColor: kPrimaryColor,
                          imagePath: kPlaneIcon,
                          imgWidth: 24.w,
                          rightPadding: 20),
                      )),
                  SizedBox(height: 14.h,),
                  ShadowCard(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
                        child: CustomTile(
                            label: kBillingHistory,
                            bgColor: kPrimaryColor,
                            imagePath: kHistoryIcon,
                            imgWidth: 21.w,
                            rightPadding: 20),
                      )),
                  SizedBox(height: 14.h,),
                  ShadowCard(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
                        child: CustomTile(
                            label: kCancelSubs,
                            imagePath: kCancelIcon,
                            imgWidth: 29.w,
                            rightPadding: 20),
                      )),
                  SizedBox(height: 32.h),
                  CustomButton(
                    text: kManageSubscription,
                    onPressed: () {
                      // Get.back();
                    },
                    showIcon: false,
                    padding: 0,
                  ),
                  SizedBox(height: 55.h,),

                ],
              ),
            ),
          )
      ),

    );

  }
}




