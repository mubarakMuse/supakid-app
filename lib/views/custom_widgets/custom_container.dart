import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supakids/utils/app_colors.dart';

import '../../utils/app_styles.dart';

class CustomHomeContainer extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? color;
  final double? height1;
  final double? height2;
  final double? height3;
  final double? width;
  final String image;
  final String heading;
  final String subHeading;


  const CustomHomeContainer({
    Key? key,
    this.color,
    this.height1,
    this.height2,
    this.height3,
    this.width,
    required this.onPressed,
    required this.image,
    required this.heading,
    required this.subHeading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height:  AppStyles.height(context) / 5.6,
        width:  AppStyles.width(context) / 2.425,
        decoration: BoxDecoration(
          color: color ?? kRedColor,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 20,
              offset: const Offset(3, 4),
            ),
          ],
        ),
        child:  Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height1 ?? 32.h,),
              Image.asset(image, width: width ?? 24.w,),
              SizedBox(height: height2 ?? 5.h,),
              Text(heading, style: AppStyles.interStyle(kWhiteColor, 15, FontWeight.w700),),
              SizedBox(height:height3 ?? 5.h,),
              Text(subHeading, style: AppStyles.interStyle(kWhiteColor, 10, FontWeight.w400).copyWith(
                height: 1.5
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
