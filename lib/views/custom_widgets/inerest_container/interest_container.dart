import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/inerest_container/controller/interest_controller.dart';

class CustomInterestContainer extends GetView<InterestController> {
  final Color color;
  final Color? textColor;
  final String text;
  final bool isInitiallySelected;

  CustomInterestContainer({
    Key? key,
    required this.color,
    required this.text,
    this.textColor,
    this.isInitiallySelected = false,
  }) : super(key: key) {

    if (isInitiallySelected && !controller.selectedInterests.contains(text)) {
      controller.selectedInterests.add(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isSelected = controller.selectedInterests.contains(text);
      return GestureDetector(
        onTap: () => controller.toggleInterest(text),
        child: Container(
          width: AppStyles.width(context) / 3.9,
          decoration: BoxDecoration(
            color: isSelected ? color : kTransparentColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? kTransparentColor : kDarkGrey,
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                text,
                style: AppStyles.interStyle(
                  isSelected ? textColor ?? kWhiteColor : kDarkGrey,
                  14,
                  isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
