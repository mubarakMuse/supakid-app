import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';

class CircleContainer extends StatelessWidget {
  final Widget child;
  const CircleContainer({ required this.child ,super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 30.h,
      width: 30.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),

        ],
        color: kWhiteColor,
        shape: BoxShape.circle,
        border: Border.all(
            color: kBlackColor
        ),
      ),
      child: child,
    );
  }
}
