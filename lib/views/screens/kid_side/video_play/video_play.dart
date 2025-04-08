import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/custom_header.dart';
import 'package:supakids/views/screens/kid_side/video_play/controller/video_play_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../utils/app_strings.dart';
import '../../../custom_widgets/background_container.dart';
import '../../../custom_widgets/custom_search_field.dart';


class VideoPlayScreen extends GetView<VideoPlayController> {
  const VideoPlayScreen({super.key});

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
                const CustomHeader(),
                SizedBox(height: 15.h,),
                const CustomSearchField(text: kSearch),
                SizedBox(height: 30.h,),
                // YoutubePlayerBuilder(
                //   player: YoutubePlayer(controller: controller.youtubeController),
                //   builder: (context, player) {
                //     return Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         SizedBox(height: 20.h),
                //         player,
                //         Text(controller.data['title'], style: AppStyles.interStyle(kBlackColor, 18, FontWeight.w800)),
                //         SizedBox(height: 10.h),
                //         Text(controller.data['description'], style: AppStyles.interStyle(kMidGreyColor, 13, FontWeight.w400)),
                //         SizedBox(height: 13.h),
                //         Text(kViews, style: AppStyles.interStyle(kPrimaryColor, 13, FontWeight.w400)),
                //         SizedBox(height: 26.h),
                //         Text(kNextWatch, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
                //         SizedBox(height: 10.h),
                //         Obx(() {
                //           return ListView.builder(
                //             padding: EdgeInsets.zero,
                //             shrinkWrap: true,
                //             physics: const NeverScrollableScrollPhysics(),
                //             itemCount: controller.nextWatching.length,
                //             itemBuilder: (context, index) {
                //               var data = controller.nextWatching[index];
                //               return Column(
                //                 children: [
                //                   Row(
                //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                     children: [
                //                       GestureDetector(
                //                         onTap: () => Get.toNamed(kVideoPlay),
                //                         child: Image.asset(data["image"] ?? "", width: 170.w, fit: BoxFit.cover),
                //                       ),
                //                       Column(
                //                         crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             data["title"] ?? "",
                //                             style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800).copyWith(height: 1.5),
                //                           ),
                //                           SizedBox(height: 5.h),
                //                           Text(
                //                             kLorem,
                //                             style: AppStyles.interStyle(kMidGreyColor, 10, FontWeight.w400).copyWith(height: 1.5),
                //                           ),
                //                           SizedBox(height: 10.h),
                //                           Text(
                //                             data["time"] ?? "",
                //                             style: AppStyles.interStyle(kPrimaryColor, 12, FontWeight.w400),
                //                           ),
                //                         ],
                //                       ),
                //                     ],
                //                   ),
                //                   SizedBox(height: 20.h),
                //                   const Divider(
                //                     height: 2,
                //                     color: kPrimaryColor,
                //                     thickness: 2,
                //                   ),
                //                   SizedBox(height: 15.h),
                //                 ],
                //               );
                //             },
                //           );
                //         }),
                //         SizedBox(height: 45.h),
                //       ],
                //     );
                //   },
                // )
                Obx(() {
                  if (controller.isVideoLoaded.value) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),

                        // Youtube Player
                        YoutubePlayerBuilder(
                          player: YoutubePlayer(controller: controller.youtubeController),
                          builder: (context, player) {
                            return Column(
                              children: [
                                player,
                                SizedBox(height: 10.h),
                              ],
                            );
                          },
                        ),

                        // Video Details
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.data['title'], style: AppStyles.interStyle(kBlackColor, 18, FontWeight.w800)),
                              SizedBox(height: 10.h),
                              Text(controller.data['description'], style: AppStyles.interStyle(kMidGreyColor, 13, FontWeight.w400)),
                              SizedBox(height: 13.h),
                              Text(kViews, style: AppStyles.interStyle(kPrimaryColor, 13, FontWeight.w400)),
                            ],
                          ),
                        ),

                        SizedBox(height: 26.h),

                        // Next Watch Section
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(kNextWatch, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
                        ),
                        SizedBox(height: 10.h),

                      ],
                    );
                  } else if (controller.remainingTime.value == -1) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Center(child: Text("Watch limit exceeded or video not available"));
                  }
                })



              ],
            ),
          ),
        ),
      )

    );
  }
}
