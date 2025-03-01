import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import 'package:supakids/views/screens/Parental_Side/home/active_history/controller/active_history_controller.dart';
  import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/back_button.dart';
import '../../../../custom_widgets/loading.dart';


class ActiveHistoryScreen extends GetView<ActiveHistoryController> {
  const ActiveHistoryScreen({super.key});

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
                  SizedBox(height: 15.h,),
                  Text(kViewingActivity, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800).copyWith(
                      height: 1.5
                  )),
                  SizedBox(height: 3.h),
                  Text(kSeeWhat, style: AppStyles.interStyle(kMidGreyColor, 14 , FontWeight.w400)),
                  SizedBox(height: 34.h),
                  Text(kWatchHistory, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
                  SizedBox(height: 10.h),
                  Obx(() {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.historyList.length,
                      itemBuilder: (context, index) {
                        var item = controller.historyList[index];

                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(item["image"] ?? "", width: 170.w, fit: BoxFit.cover),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["title"] ?? "",
                                      style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)
                                          .copyWith(height: 1.5),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      kLorem, // Keeping same description
                                      style: AppStyles.interStyle(kMidGreyColor, 10, FontWeight.w400)
                                          .copyWith(height: 1.5),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      item["time"] ?? "",
                                      style: AppStyles.interStyle(kPrimaryColor, 12, FontWeight.w400),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 20.h),
                            const Divider(
                              height: 2,
                              color: kPrimaryColor,
                              thickness: 2,
                            ),
                            SizedBox(height: 15.h),
                          ],
                        );
                      },
                    );
                  }),
                  SizedBox(height: 61.h),
                  CustomButton(
                    text: kClearHistory,
                    onPressed: () {
                      Get.back();
                      showToast(context, msg: kHistoryClear, duration: 2);
                    },
                    showIcon: false,
                    padding: 0,
                  ),
                  SizedBox(height: 52.h,),

                ],
              ),
            ),
          )
      ),

    );

  }
}




