import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';

class SmallButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? image;
  final String? text;
  final Color? textColor;
  final Color? imageColor;
  final Color? bgColor;
  final double? imageSize;
  final double? width;
  final double? sizeWidth;
  const SmallButton({
    required this.onTap,
    required this.text,
    this.image,
    this.bgColor,
    this.textColor,
    this.imageColor,
    this.imageSize,
    this.width,
    this.sizeWidth,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? AppStyles.width(context)/ 5.1.w,
        height: AppStyles.height(context) * 0.048,
        decoration: BoxDecoration(
          color: bgColor ?? kPrimaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image ?? kEditIcon, width: imageSize ?? 13.w, color: imageColor ?? kWhiteColor,),
            SizedBox(width: sizeWidth,),
            Text(text ?? kEdit, style: AppStyles.interStyle(textColor ?? kWhiteColor, 14, FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
