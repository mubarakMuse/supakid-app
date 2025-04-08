import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';


class CustomTextField extends StatelessWidget{
  final TextEditingController fieldController;
  final String hintText;
  final TextInputType? keyboardType;
  final String? errorText;
  final bool readOnly;
  final int? maxLines;
  final EdgeInsetsGeometry? padding;

  const CustomTextField({
    Key? key,
    required this.fieldController,
    required this.hintText,
    this.errorText,
    this.readOnly = false,
    this.keyboardType,
    this.maxLines = 1,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      keyboardType: keyboardType,
      readOnly: readOnly,
      maxLines: maxLines,
      controller: fieldController,
      decoration: InputDecoration(
          contentPadding: padding ?? const  EdgeInsets.symmetric(horizontal: 15 ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kFieldColor,
          ),
        ),
        hintText: hintText,
        errorText: errorText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
        ),
      ),
      style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w500),
    );
  }
}

