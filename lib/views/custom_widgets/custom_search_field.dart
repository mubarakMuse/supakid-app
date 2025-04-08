import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/shadow_card.dart';
import '../../utils/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  final String text;
  const CustomSearchField({required this.text , super.key});

  @override
  Widget build(BuildContext context) {
    return    ShadowCard(
      child: TextField(
        style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400),
        decoration: InputDecoration(
            filled: true ,
            fillColor: kCardColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 22.w,vertical: 20.h),
            hintText: text,
            suffixIcon: const Icon(Icons.search_rounded, color: kPrimaryColor,),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide.none
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide.none
            ),
        ),
      ),
    );
  }
}
