import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import 'package:supakids/views/screens/Parental_Side/home/youtube_playlist/controller/youtube_playlist_controller.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/back_button.dart';
import '../../../../custom_widgets/shadow_card.dart';


class YoutubePlaylistScreen extends GetView<YoutubePlaylistController> {
  const YoutubePlaylistScreen({super.key});

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
                        Text(kManagedYoutube, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800).copyWith(
                            height: 1.5
                        )),
                        SizedBox(height: 3.h),
                        Text(kOnlySafe, style: AppStyles.interStyle(kMidGreyColor, 14 , FontWeight.w400)),
                        SizedBox(height: 31.h),
                        ShadowCard(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(kApprovedChannels, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
                                    Text(kActions, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
                                  ],
                                ),
                                SizedBox(height: 12.h),
                                Obx(() {
                                  return Column(
                                    children: controller.playlist.map((item) {
                                      int index = controller.playlist.indexOf(item);
                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.0.h),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(item,style: AppStyles.interStyle(kMidGreyColor, 12, FontWeight.w400), ),
                                            GestureDetector(
                                              onTap: () => controller.removeItem(context,index),
                                              child: Row(
                                                children: [
                                                  Image.asset(kDelIcon, width: 16.w, color: kRedColor),
                                                  SizedBox(width: 3.w),
                                                  Text(kRemove, style: AppStyles.interStyle(kRedColor, 12, FontWeight.w400)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                CustomButton(
                  text: kAddNewChannels,
                  onPressed: () {
                    Get.toNamed(kAddNewChannel);
                  },
                  showIcon: false,
                  padding: 0,
                ),
                SizedBox(height: 46.h,),
              ],
            ),
          )
      ),

    );

  }
}




