import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';

import '../../../../utils/app_strings.dart';
import '../../../custom_widgets/game_container.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kRedColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(height: 60.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(kGames, style: AppStyles.interStyle(kWhiteColor, 24, FontWeight.w800),),
                    Text(kPlayLearn, style: AppStyles.interStyle(kWhiteColor, 13, FontWeight.w400),),
                  ],
                ),
                Image.asset(kSupaLogo, width: 130.w),
              ],
            ),
            SizedBox(height: 28.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GameContainer(image: kGame1,),
                GameContainer(image: kGame2,),
              ],
            ),
            SizedBox(height: 40.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GameContainer(image: kGame3,),
                GameContainer(image: kGame4,),
              ],
            ),
            SizedBox(height: 40.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GameContainer(image: kGame5,),
                GameContainer(image: kGame6,),
              ],
            ),
            SizedBox(height: 30.h,),


          ],
        ),
      ),
    );
  }
}
