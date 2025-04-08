import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomDropdown extends StatelessWidget {
  final String selectedValue;
  final Function(String) onChanged;
  final List<String> options;

  const CustomDropdown({
    Key? key,
    required this.selectedValue,
    required this.onChanged,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w500),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kFieldColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kFieldColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
      ),
      dropdownColor: kWhiteColor,
      borderRadius: BorderRadius.circular(12),
      items: options
          .map((options) => DropdownMenuItem(
        value: options,
        child: Text(options, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w500)),
      ))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }
}
