import 'package:flutter/cupertino.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';

class CustomInterestContainer extends StatelessWidget {
  final Color color;
  final Color? textColor;
  final String text;

  const CustomInterestContainer({
    Key? key,
    required this.color,
    required this.text,
    this.textColor
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.052,
        width: AppStyles.width(context),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(text, style: AppStyles.interStyle(textColor ?? kWhiteColor, 14, FontWeight.w600),)),
      ),
    );
  }
}