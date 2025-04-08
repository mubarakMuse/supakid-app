import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/custom_header.dart';
import 'package:supakids/views/screens/kid_side/category/controller/category_controller.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../custom_widgets/background_container.dart';


class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({super.key});

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
                Text(controller.data['label'], style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w800),),
                SizedBox(height: 26.h,),
                Obx(() {
                  return Wrap(
                    children: List.generate(controller.allVideos.length, (index){
                      var data = controller.allVideos[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () => Get.toNamed(kVideoPlay, arguments: data),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 170.w,
                                  height: (170.w / 16) * 9,
                                  decoration: const BoxDecoration(color: Colors.transparent),
                                  child: Image.network(
                                    Helpers.getYouTubeThumbnail(data['youtubeUrl']),
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const Center(child: CircularProgressIndicator());
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(child: Icon(Icons.error));
                                    },
                                  ),
                                ),
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
                                      SizedBox(height: 5.h),
                                      Text(
                                          data["description"] ?? "",
                                        style: AppStyles.interStyle(kMidGreyColor, 10, FontWeight.w400)
                                            .copyWith(height: 1.5),
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const Text('🕒 '),
                                          Text(
                                            Helpers.formatTime(data["createdAt"]),
                                            style: AppStyles.interStyle(kPrimaryColor, 12, FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          const Divider(
                            height: 2,
                            color: kPrimaryColor,
                            thickness: 2,
                          ),
                          SizedBox(height: 15.h),
                        ],
                      );
                    }),
                  );
                }),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}
