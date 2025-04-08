import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class GraphCard extends StatelessWidget {
  final String heading;
  final String subHeading;
  final String image;
  const GraphCard({
    required this.heading,
    required this.subHeading,
    required this.image,

    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppStyles.width(context),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: kChartBColor,
          )
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 21.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 23.h,),
            Text(heading, style: AppStyles.interStyle(kPrimaryColor, 13, FontWeight.w500),),
            SizedBox(height: 5.h,),
            Text(subHeading, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w700),),
            SizedBox(height: 42.h,),
            Image.asset(image, fit: BoxFit.cover,),
            SizedBox(height: 27.h,),


          ],
        ),
      ),
    );
  }
}
