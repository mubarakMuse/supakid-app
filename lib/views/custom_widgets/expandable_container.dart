import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';

import '../../utils/app_styles.dart';

class ExpandableContainer extends StatelessWidget {
  final RxBool isExpanded;
  final VoidCallback onToggle;
  final List<Widget> children;
  final String title;
  const ExpandableContainer({
    Key? key,
    required this.isExpanded,
    required this.onToggle,
    required this.children,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: isExpanded.value
          ? AppStyles.height(context) / 4.31
          : AppStyles.height(context) * 0.099,
      width: AppStyles.width(context),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(6, 6),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onToggle,
              child: Container(
                height: AppStyles.height(context) * 0.075.h,
                width:  AppStyles.width(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPrimaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: AppStyles.interStyle(
                              kWhiteColor, 14, FontWeight.w600) ),
                      Icon(
                        isExpanded.value
                            ? Icons.keyboard_arrow_up_sharp
                            : Icons.keyboard_arrow_down_sharp,
                        color: kWhiteColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isExpanded.value) ...[
               SizedBox(height: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ]
          ],
        ),
      ),
    ));
  }
}
