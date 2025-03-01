import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/views/custom_widgets/shadow_card.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class HourSelectorCard extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final RxInt hours;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const HourSelectorCard({
    Key? key,
    required this.title,
    required this.hours,
    required this.onIncrement,
    required this.onDecrement,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ShadowCard (
      width: AppStyles.width(context),
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 17),
        child: Column(
          children: [
            Container(
              height: AppStyles.height(context) * 0.075.h,
              width:  AppStyles.width(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kPrimaryColor,
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Text(title, style: AppStyles.interStyle(
                        kWhiteColor, 14, FontWeight.w600) ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: onDecrement,
                      child: Icon(Icons.arrow_back_ios, size: 20.w, color: kBlackColor,)),
                  Obx(() =>
                      Text('${hours.value} hour', style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w600)),
                  ),
                  GestureDetector(
                      onTap: onIncrement,
                      child: Icon(Icons.arrow_forward_ios, size: 20.w, color: kBlackColor,)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
