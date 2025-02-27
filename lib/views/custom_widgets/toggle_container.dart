import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';

import '../../utils/app_styles.dart';

class CustomSwitchTile extends StatelessWidget {
  final String label;
  final RxBool? switchValue;
  final VoidCallback? onToggle;
  final String? imagePath;
  final double? padding;
  final Color? bgColor;
  final Color? switchColor;
  final double? height;

  const CustomSwitchTile({
    Key? key,
    required this.label,
     this.switchValue,
     this.onToggle,
    this.imagePath,
    this.padding,
    this.bgColor,
    this.switchColor,
    this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? AppStyles.height(context) * 0.075.h,
      width: AppStyles.width(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor ?? kRedColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(right: padding ?? 3.0.w, left: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppStyles.interStyle(kWhiteColor, 14, FontWeight.w600)
            ),
            imagePath != null
                ? Image.asset(
              imagePath!,
              height: 29.h,
              width: 29.w,
              fit: BoxFit.cover,
            )
                : Obx(() => Transform.scale(
              scale: 0.7.w,
              child: Switch(
                value: switchValue!.value,
                onChanged: (value) => onToggle!(),
                activeColor:switchColor ?? kRedColor,
                activeTrackColor: kWhiteColor,
                inactiveThumbColor: kWhiteColor,
                inactiveTrackColor: Colors.white54,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
