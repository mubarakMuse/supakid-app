import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/views/custom_widgets/shadow_card.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';

class ContentCard extends StatelessWidget {
  final String name;
  final String age;
  final String favorite;
  final String screenTime;
  final VoidCallback? onTap;

  const ContentCard({
    Key? key,
    required this.name,
    required this.age,
    required this.favorite,
    required this.screenTime,
     this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ShadowCard(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 31.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(kChildIcon, width: 18.w,),
                  SizedBox(width: 14.w,),
                  Text(name, style: AppStyles.interStyle(kBlackColor, 14 , FontWeight.w400)),
                ],
              ),
              SizedBox(height: 11.h,),
              Row(
                children: [
                  Image.asset(kAgeIcon, width: 19.w,),
                  SizedBox(width: 13.w,),
                  Text('Age: ${age}', style: AppStyles.interStyle(kBlackColor, 14 , FontWeight.w400)),
                ],
              ),
              SizedBox(height: 11.h,),
              Row(
                children: [
                  Image.asset(kFavouriteIcon, width: 20.w,),
                  SizedBox(width: 12.w,),
                  Text('Favourite: ${favorite}', style: AppStyles.interStyle(kBlackColor, 14 , FontWeight.w400)),
                ],
              ),
              SizedBox(height: 11.h,),
              Row(
                children: [
                  Image.asset(kMobileIcon, width: 22.w,),
                  SizedBox(width: 10.w,),
                  Text('Screen Time: ${screenTime}', style: AppStyles.interStyle(kBlackColor, 14 , FontWeight.w400)),
                ],
              ),
              SizedBox(height: 21.h,),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: AppStyles.width(context)/ 4.w,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 13.0.w , vertical: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.edit_note_outlined, color: kWhiteColor, size: 20.h,),
                        Text(kCustom, style: AppStyles.interStyle(kWhiteColor, 14 , FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}
