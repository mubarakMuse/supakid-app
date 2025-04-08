import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import 'package:supakids/views/custom_widgets/custom_search_field.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/back_button.dart';
import '../../../../custom_widgets/loading.dart';
import '../../../../custom_widgets/shadow_card.dart';
import 'controller/add_new_channel_controller.dart';


class AddNewChannelScreen extends GetView<AddNewChannelController> {
  const AddNewChannelScreen({super.key});

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
                        SizedBox(height: 28.h),
                        const CustomSearchField(text: kEnterChannel),
                        SizedBox(height: 22.h),
                        ShadowCard(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
                            child: Column(
                              children: [
                                Obx(() {
                                  return Column(
                                    children: controller.playlist.map((item) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: 11.0.h),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item,
                                              style: AppStyles.interStyle(kMidGreyColor, 12, FontWeight.w400),
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(kApprovedIcon, width: 12.w, color: kGreenColor),
                                                SizedBox(width: 6.w),
                                                Text(kApprovedChannels, style: AppStyles.interStyle(kGreenColor, 12, FontWeight.w400)),
                                              ],
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
                  text: kSaveYoutube,
                  onPressed: () {
                    Get.back();
                    showToast(context, msg: kYoutubePrefer);
                  },
                  showIcon: false,
                  padding: 0,
                ),
                SizedBox(height: 12.h,),
                TextButton(
                    onPressed: () => Get.back(),
                    child: Text(kCancel, style: AppStyles.interStyle(kRedColor, 12, FontWeight.w400),)
                ),
                SizedBox(height: 24.h,),
              ],
            ),
          )
      ),

    );

  }
}




