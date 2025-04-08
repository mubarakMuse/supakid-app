import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_header.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../custom_widgets/content_card.dart';
import '../../../custom_widgets/shadow_card.dart';
import 'controller/content_preference_controller.dart';


class ContentPreferenceScreen extends GetView<ContentPreferenceController> {
  const ContentPreferenceScreen({super.key});

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
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 60.h,),
                     const CustomHeader(),
                     SizedBox(height: 15.h,),
                     Text(kCustomize, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800).copyWith(
                         height: 1.5
                     )),
                     SizedBox(height: 3.h),
                     Text(kCustomizeChild, style: AppStyles.interStyle(kMidGreyColor, 14 , FontWeight.w400)),
                     SizedBox(height: 20.h),
                   ],
                 ),
               ),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
                  child: Column(
                    children: [
                       const ContentCard(
                        name: kAlexs,
                        age: kYears,
                        favorite: kFavouriteScience,
                        screenTime: kScreenTimePer,
                      ),
                      SizedBox(height: 30.h,),
                      const ContentCard(
                        name: kMeerub,
                        age: kTenYears,
                        favorite: kSportAnimals,
                        screenTime: kScreenTimePer,
                      ),
                      SizedBox(height: 30.h,),
                      const ContentCard(
                        name: kIqra,
                        age: kEightYears,
                        favorite: kArtLearning,
                        screenTime: kScreenTimePer,
                      ),
                      SizedBox(height: 30.h,),


                    ],
                  ),
                )



              ],
            ),
          )
      ),

    );

  }
}




