import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/graph_card.dart';
import 'package:supakids/views/screens/admin_side/admin_home/controller/admin_home_controller.dart';
import '../../../../utils/app_strings.dart';
import '../../../custom_widgets/background_container.dart';



class AdminHomeScreen extends GetView<AdminHomeController> {
  const AdminHomeScreen({super.key});

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
                Text(kReportsAnalytics, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800),),
                SizedBox(height: 3.h,),
                Text(kViewEngage, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                SizedBox(height: 15.h,),
                GraphCard(
                    heading: kMostWatched,
                    subHeading: kEducational,
                    image: kGraph1IMG),
                SizedBox(height: 26.h,),
                GraphCard(
                    heading: kAvgTime,
                    subHeading: kMinDay,
                    image: kGraph2IMG),
                SizedBox(height: 26.h,),
                GraphCard(
                    heading: kMostPopular,
                    subHeading: kLearnWith,
                    image: kGraph3IMG),
                SizedBox(height: 26.h,),
                GraphCard(
                    heading: kActiveKids,
                    subHeading: kTwelve,
                    image: kGraph4IMG),
                SizedBox(height: 30.h,),
              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}
