import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/custom_header.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../../../utils/app_styles.dart';
import '../../../../custom_widgets/custom_tile.dart';
import '../../../../custom_widgets/shadow_card.dart';

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({super.key});

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
                      Text(kContactSupports,style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                      SizedBox(height: 3.h),
                      Text(kNeedHelp, style: AppStyles.interStyle(kMidGreyColor, 14 , FontWeight.w400)),
                      SizedBox(height: 25.h),

                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShadowCard(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
                            child: CustomTile(
                              label: kSupport,
                              bgColor: kPrimaryColor,
                              imagePath: kEmailIcon,
                              rightPadding: 17.w,
                            ),
                          )),
                      SizedBox(height: 14.h),
                      ShadowCard(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
                            child: CustomTile(
                              label: kNumber,
                              bgColor: kPrimaryColor,
                              imagePath: kPhoneIcon,
                              rightPadding: 17.w,
                              imgWidth: 20.w,
                            ),
                          )),
                      SizedBox(height: 37.h),
                      Center(child: Text(kFAQ,style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800))),
                      SizedBox(height: 10.h),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 17.0.w),
                        child: Column(
                          children: [
                            Text(kIsMultiple, style: AppStyles.interStyle(kBlackColor, 15, FontWeight.w800),),
                            SizedBox(height: 5.h),
                            Text(kYesInterface, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                            SizedBox(height: 15.h),
                            Text(kIsMultiple, style: AppStyles.interStyle(kBlackColor, 15, FontWeight.w800),),
                            SizedBox(height: 5.h),
                            Text(kYesInterface, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                            SizedBox(height: 15.h),
                            Text(kIsMultiple, style: AppStyles.interStyle(kBlackColor, 15, FontWeight.w800),),
                            SizedBox(height: 5.h),
                            Text(kYesInterface, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                            SizedBox(height: 15.h),
                            Text(kIsMultiple, style: AppStyles.interStyle(kBlackColor, 15, FontWeight.w800),),
                            SizedBox(height: 5.h),
                            Text(kYesInterface, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                            SizedBox(height: 50.h,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 60.h,),






              ],
            ),
          )
      ),

    );

  }
}




