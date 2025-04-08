import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/custom_header.dart';
import 'package:supakids/views/screens/kid_side/favourite/controller/favourite_controller.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../custom_widgets/background_container.dart';
import '../../../custom_widgets/circle_container.dart';


class FavouriteScreen extends GetView<FavouriteController> {
  const FavouriteScreen({super.key});

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
                Text(kYourFavourites, style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w800),),
                SizedBox(height: 3.h,),
                Text(kWatchAnytime, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                SizedBox(height: 5.h,),
                Obx(() {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.nextWatching.length,
                    itemBuilder: (context, index) {
                      var data = controller.nextWatching[index];
                      return Padding(
                        padding:  EdgeInsets.only(top: 15.0.h),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(kVideoPlay),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(data["image"] ?? "", width: 170.w, fit: BoxFit.cover),
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
                                          kLorem, // Keeping same description
                                          style: AppStyles.interStyle(kMidGreyColor, 10, FontWeight.w400)
                                              .copyWith(height: 1.5),
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              data["time"] ?? "",
                                              style: AppStyles.interStyle(kPrimaryColor, 12, FontWeight.w400),
                                            ),
                                            CircleContainer(
                                              child:  Obx(() => GestureDetector(
                                                onTap: () => controller.toggleFavorite(index,context),
                                                child: Icon(
                                                    controller.isFavorite[index] ? Icons.favorite : Icons.favorite_border,
                                                    color: controller.isFavorite[index] ? kRedColor : kDarkGrey,
                                                  size: 18,
                                                ),
                                              ),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 19.h),
                              const Divider(
                                height: 2,
                                color: kPrimaryColor,
                                thickness: 2,
                              ),
                              // SizedBox(height: 15.h),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
                SizedBox(height: 45.h),

              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}
