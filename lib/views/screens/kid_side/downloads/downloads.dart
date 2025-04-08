import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/custom_header.dart';
import 'package:supakids/views/screens/kid_side/downloads/controller/downloads_controller.dart';
import '../../../../utils/app_strings.dart';
import '../../../custom_widgets/background_container.dart';
import '../../../custom_widgets/circle_container.dart';


class DownloadsScreen extends GetView<DownloadsController> {
  const DownloadsScreen({super.key});

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
                Text(kYourDownloads, style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w800),),
                SizedBox(height: 3.h,),
                Text(kWatchAnytime, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                SizedBox(height: 5.h,),
                Obx(() {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.downloads.length,
                    itemBuilder: (context, index) {
                      var data = controller.downloads[index];
                      return Padding(
                        padding:  EdgeInsets.only(top: 15.0.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () => Get.toNamed(kVideoPlay),
                                    child: Image.asset(data["image"] ?? "", width: 170.w, fit: BoxFit.cover)),
                                SizedBox(width: 15.w,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data["title"] ?? "",
                                        style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)
                                            .copyWith(height: 1.5),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        kLorem, // Keeping same description
                                        style: AppStyles.interStyle(kMidGreyColor, 10, FontWeight.w400)
                                            .copyWith(height: 1.5),
                                      ),
                                      SizedBox(height: 4.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            data["time"] ?? "",
                                            style: AppStyles.interStyle(kPrimaryColor, 12, FontWeight.w400),
                                          ),
                                           CircleContainer(
                                            child: Center(child: Image.asset(kDownloadIcon,width: 16.w,)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15.h),
                            const Divider(
                              height: 2,
                              color: kPrimaryColor,
                              thickness: 2,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
                SizedBox(height: 30.h),

              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}
