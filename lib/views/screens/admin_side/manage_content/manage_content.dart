import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/custom_search_field.dart';
import 'package:supakids/views/screens/admin_side/manage_content/controller/content_controller.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../custom_widgets/background_container.dart';
import '../../../custom_widgets/shadow_card.dart';
import '../../../custom_widgets/small_button.dart';


class ManageContentScreen extends GetView<ContentController> {
  const ManageContentScreen({super.key});
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
                GestureDetector(
                  onTap: () => Get.toNamed(kAddVideo),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(kManageVideos, style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w800),),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(kAdd, width: 16.w),
                          SizedBox(width: 4.w),
                          Text(kAddNewVideo, style: AppStyles.interStyle(kPrimaryColor, 10, FontWeight.w700),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 3.h,),
                Text(kApproveReject, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400),),
                SizedBox(height: 20.h,),
               const CustomSearchField(text: kSearch),
                SizedBox(height: 33.h),
                Obx(() => Wrap(
                  children: List.generate(controller.allVideos.length, (index) {
                    var data = controller.allVideos[index];
                    return Padding(
                      padding:  EdgeInsets.only(bottom: 30.0.h),
                      child: ShadowCard(
                          child: Padding(
                            padding:  EdgeInsets.only(bottom:31.h, top: 20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 22.0.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: Image.network(
                                         Helpers.getYouTubeThumbnail(data['youtubeUrl']),
                                          fit: BoxFit.cover,
                                          width: AppStyles.width(context),
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) return child;
                                            return const Center(child: CircularProgressIndicator());
                                          },
                                          errorBuilder: (context, error, stackTrace) {
                                           return  const Center(child:  Icon(Icons.error));
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.h,),
                                    Row(
                                      children: [
                                        Image.asset(kPlayerIcon, width: 18.w,),
                                        SizedBox(width: 14.w,),
                                        Text('Video Title: ${data['title']!}', style: AppStyles.interStyle(kBlackColor, 14 , FontWeight.w400)),
                                      ],
                                    ),
                                    SizedBox(height: 11.h,),
                                    Row(
                                      children: [
                                        Image.asset(kCategoryIcon, width: 19.w,),
                                        SizedBox(width: 13.w,),
                                        Text('Category: ${data['category']}', style: AppStyles.interStyle(kBlackColor, 14 , FontWeight.w400)),
                                      ],
                                    ),
                                    SizedBox(height: 11.h,),
                                    Row(
                                      children: [
                                        Image.asset(kViewsIcon, width: 20.w,),
                                        SizedBox(width: 13.w,),
                                        Text('Views: ${data['views'] ?? "0"}', style: AppStyles.interStyle(kBlackColor, 14 , FontWeight.w400)),
                                      ],
                                    ),
                                    SizedBox(height: 11.h,),
                                    Row(
                                      children: [
                                        Image.asset(kStatusIcon, width: 20.w,),
                                        SizedBox(width: 12.w,),
                                        Text('Status: ${data['status']} ', style: AppStyles.interStyle(
                                            data['status'] == 'Rejected' ? kRedColor : kBlackColor, 14 , FontWeight.w400)),
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
                                      Visibility(
                                        visible: data['status'] == 'pending',
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SmallButton(
                                              width: AppStyles.width(context)/ 4.82.w,
                                              onTap: () => controller.approveVideo(index,context),
                                              text: kApprove,
                                              sizeWidth: 3.h,
                                              bgColor: kGreenColor,
                                              image: kApproveIcon,
                                              imageSize: 19.w,
                                            ),
                                            SmallButton(
                                              width: AppStyles.width(context)/ 4.82.w,
                                              onTap: () => controller.rejectVideo(index, context),
                                              text: kReject,
                                              sizeWidth: 6.h,
                                              bgColor: kRedColor,
                                              image: kDelIcon,
                                              imageSize: 19.w,
                                            ),
                                            SmallButton(
                                              width: AppStyles.width(context)/ 4.82.w,
                                              sizeWidth: 6.h,
                                              onTap: () {
                                                Get.toNamed(kEditVideo , arguments: data);
                                              },
                                              text: kEdit,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible: data['status'] == 'Approved' ||
                                            data['status'] == 'Rejected' ,
                                        child: Row(
                                          children: [
                                            SmallButton(
                                              onTap: () => Get.toNamed(kEditVideo, arguments: data),
                                              sizeWidth: 6.w,
                                              text: kEdit,
                                            ),
                                            SizedBox(width: 13.w),
                                            SmallButton(
                                              onTap: () => controller.deleteVideo(index, context),
                                              text: kDel,
                                              textColor: kBlackColor,
                                              bgColor: kNavColor,
                                              sizeWidth: 5.w,
                                              image: kDelIcon,
                                              imageSize: 18.w,
                                              imageColor: kBlackColor,
                                            ),
                                          ],
                                        ),
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
