import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../custom_widgets/background_container.dart';
import '../../../custom_widgets/custom_search_field.dart';
import 'controller/kid_home_controller.dart';

class KidHomeScreen extends GetView<KidHomeController> {
  const KidHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h,),
                    Center(child: Image.asset(kSupaLogo, width: 121.w,)),
                    SizedBox(height: 9.h,),
                    Text("$kHi ${controller.data['name']} ", style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w800),),
                    SizedBox(height: 3.h,),
                    Text(kReplyTo, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                    SizedBox(height: 10.h,),
                    const CustomSearchField(text: kSearch),
                    SizedBox(height: 25.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(kCategory, style: AppStyles.interStyle(kBlackColor, 16, FontWeight.w700),),
                        Row(
                          children: [
                            Text(kSeeAll, style: AppStyles.interStyle(kBlackColor, 12, FontWeight.w300),),
                            SizedBox(width: 6.w,),
                            Icon(Icons.arrow_forward_ios, size: 12.h,),
                          ],
                        ),


                      ],
                    ),
                    SizedBox(height: 14.h,),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 25.0.w,),
                child: SizedBox(
                  height: 90,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Wrap(
                          spacing: 10.w,
                          children: List.generate(controller.category.length, (index){
                            var categoryData = controller.category[index];
                            return    GestureDetector(
                              onTap: () => Get.toNamed(kCategories, arguments : categoryData),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      categoryData['image'] ?? '',
                                      width: 106.w,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      bottom: 9,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: Text(
                                          categoryData['label'] ?? '',
                                          style: AppStyles.interStyle(kWhiteColor, 12, FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(width: 25.w,),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(kTightsIMG, width: 380.w, fit: BoxFit.cover,),
                        Positioned(
                          bottom: 12.h,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite, size: 22.h, color: kPrimaryColor,),
                              SizedBox(width: 10.w,),
                              Text(kAddFav, style: AppStyles.interStyle(kWhiteColor, 14, FontWeight.w700),),
                            ],
                          ),),
                      ],
                    ),
                    SizedBox(height: 16.h,),
                    Center(child: Text(kSpaceForKids, style: AppStyles.interStyle(kBlackColor, 16, FontWeight.w800),)),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 60.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.add, size: 28.h,color: kRedColor,),
                              Text(kMyList, style: AppStyles.interStyle(kBlackColor, 13, FontWeight.w400),),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.play_arrow_rounded, size: 24.h, color: kPrimaryColor,),
                              SizedBox(width: 6.w,),
                              Text(kPlay, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400),),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.info_outline, size: 28.h,color: kRedColor,),
                              Text(kInfo, style: AppStyles.interStyle(kBlackColor, 13, FontWeight.w400),),

                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 25.h,),
                    Text(kContinueWatching, style: AppStyles.interStyle(kBlackColor, 16, FontWeight.w700),),
                    SizedBox(height: 16.h,),
                  ],
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:  EdgeInsets.only(left: 25.0.w),
                  child: Row(
                    children: [
                      Wrap(
                        spacing: 6.w,
                        children: controller.watching.map((watching) {
                          return Stack(
                            children: [
                              Image.asset(watching['image'], width: 104.w,),
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    height: 38.h,
                                    width: 38.w,
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor.withValues(alpha: 0.6,),
                                        shape: BoxShape.circle
                                    ),
                                    child: Icon(Icons.play_arrow, size: 19.h,color: kWhiteColor,),
                                  ),
                                ),
                              ),

                            ],
                          );
                        }).toList(),
                      ),
                      SizedBox(width: 25.w,),

                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.h,),









            ],
          ),
        ),
      )
      ,
    );
  }
}
