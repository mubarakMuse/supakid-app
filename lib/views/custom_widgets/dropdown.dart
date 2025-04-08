import 'package:flutter/material.dart';
import 'package:supakids/views/custom_widgets/shadow_card.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';

class Dropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? text;
  final String? errorText;

  const Dropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.text,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShadowCard(
          bgColor: kWhiteColor,
          borderRadius: 10,
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton<String>(
                value: value?.isEmpty == true ? null : value,
                hint: Text(
                  text ?? kSelectOption,
                  style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),
                ),
                icon: const Icon(Icons.arrow_drop_down, color: kMidGreyColor, size: 20),
                dropdownColor: kWhiteColor,
                borderRadius: BorderRadius.circular(12),
                onChanged: onChanged,
                items: items.map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        if (errorText != null && errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Text(
              errorText!,
              style: AppStyles.interStyle(kRedColor, 14, FontWeight.w400),
            ),
          ),
      ],
    );
  }
}
