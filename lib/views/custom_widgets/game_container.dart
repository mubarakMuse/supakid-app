import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';

class GameContainer extends StatelessWidget {
  final String image;
  const GameContainer({ required this.image ,super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.3),
                offset: const Offset(10, -10),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: SizedBox(
              height: 151.h,
              width: 170.w,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        Text(kKidsGame, style: AppStyles.interStyle(kWhiteColor, 18, FontWeight.w800),),
      ],
    );
  }
}
