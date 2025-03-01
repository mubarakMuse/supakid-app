import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';

import '../../utils/app_styles.dart';

class CustomTile extends StatelessWidget {
  final String label;
  final RxBool? switchValue;
  final VoidCallback? onToggle;
  final String? imagePath;
  final double? rightPadding;
  final double? leftPadding;
  final Color? bgColor;
  final Color? textColor;
  final Color? switchColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final double? height;
  final double? imgWidth;
  final VoidCallback? onTap;

  const CustomTile({
    Key? key,
    required this.label,
     this.switchValue,
     this.onToggle,
    this.imagePath,
    this.rightPadding,
    this.bgColor,
    this.switchColor,
    this.height,
    this.imgWidth,
    this.onTap,
    this.leftPadding,
    this.textColor,
    this.activeColor,
    this.inactiveColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? AppStyles.height(context) * 0.075.h,
        width: AppStyles.width(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor ?? kRedColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(right: rightPadding ?? 3.0.w, left: leftPadding ?? 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: AppStyles.interStyle(textColor ?? kWhiteColor, 14, FontWeight.w600),
              ),

              if (imagePath != null)
                Image.asset(
                  imagePath!,
                  width: imgWidth ?? 29.w,
                  fit: BoxFit.cover,
                )
              else if (switchValue != null && onToggle != null)
                Obx(() => Transform.scale(
                  scale: 0.7.w,
                  child: Switch(
                    value: switchValue!.value,
                    onChanged: (value) => onToggle!(),
                    activeColor: switchColor ?? kRedColor,
                    activeTrackColor: activeColor ?? kWhiteColor,
                    inactiveThumbColor: inactiveColor ?? kWhiteColor,
                    inactiveTrackColor: Colors.white54,
                  ),
                )),
            ],
          ),
        ),
      ),
    );
  }

}
