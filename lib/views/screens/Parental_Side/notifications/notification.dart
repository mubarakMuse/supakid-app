import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import 'package:supakids/views/custom_widgets/custom_header.dart';
import 'package:supakids/views/custom_widgets/shadow_card.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../custom_widgets/back_button.dart';
import 'controller/notification_controller.dart';



class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h,),
                 const CustomHeader(),
                  SizedBox(height: 15.h,),
                  Text(kRecentProfile, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800).copyWith(
                      height: 1.5
                  )),
                  SizedBox(height: 3.h),
                  Text(kStayUpdate, style: AppStyles.interStyle(kMidGreyColor, 14 , FontWeight.w400)),
                  SizedBox(height: 14.h),
                  Text(kWatchHistory, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
                  SizedBox(height: 10.h),
                  Obx(() {
                    return Column(
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.displayCount.value,
                          itemBuilder: (context, index) {
                            var item = controller.notificationList[index];
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    ShadowCard(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 30.h),
                                        child: Row(
                                          children: [
                                            Image.asset(kBell, width: 16.w, color: kPrimaryColor),
                                            SizedBox(width: 10.w),
                                            Text(
                                              item['title'] ?? "",
                                              style: AppStyles.interStyle(kBlackColor, 12, FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10.h,
                                      right: 29.w,
                                      child: Text(
                                        item["time"] ?? "",
                                        style: AppStyles.interStyle(kPrimaryColor, 10, FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 18.h),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 20.h),
                        if (controller.displayCount.value < controller.notificationList.length)
                          CustomButton(
                            text: kViewMore,
                            onPressed: () {
                              controller.loadMore();
                            },
                            showIcon: false,
                            padding: 0,
                          ),
                      ],
                    );
                  }),

                  SizedBox(height: 30.h,),

                ],
              ),
            ),
          )
      ),

    );

  }
}




