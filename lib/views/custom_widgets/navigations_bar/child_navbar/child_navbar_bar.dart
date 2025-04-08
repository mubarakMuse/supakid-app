import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_images.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/navigations_bar/child_navbar/controller/child_navbar_controller.dart';
import 'package:supakids/views/screens/kid_side/downloads/downloads.dart';
import 'package:supakids/views/screens/kid_side/favourite/favourite.dart';
import 'package:supakids/views/screens/kid_side/game/game.dart';
import 'package:supakids/views/screens/kid_side/profile/profile.dart';

import '../../../screens/kid_side/home/kid_home.dart';


class ChildNavBar extends GetView<ChildNavBarController> {


  final List<Widget> screens = [
    KidHomeScreen(),
    GameScreen(),
    FavouriteScreen(),
    ProfileScreen(),
    DownloadsScreen(),
  ];

  final List imagePaths = [
    kHomeIcon,
    kGameIcon,
    kFavIcon,
    kProfileIcon,
    kMyDownloadIcon,
  ];

  final List labels = ["Home", "Games", "Favorites", "Profile", "Downloads"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
            () => Container(
                      padding:  EdgeInsets.symmetric(vertical: 8, horizontal: 25.w),
                      decoration: BoxDecoration(
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset:const Offset(0, -3),
              ),
            ],
                      ), child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(imagePaths.length, (index) {
              bool isSelected = controller.selectedIndex.value == index;
              return GestureDetector(
                onTap: () => controller.changeIndex(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 65.w,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected ? kPrimaryColor : kNavColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        imagePaths[index],
                        width: 30.w,
                        height: 30.w,
                        color: isSelected ? kWhiteColor : kBlackColor,
                      ),
                    ),
                     SizedBox(height: 4.h),
                    Text(
                      labels[index],
                      style: AppStyles.interStyle(isSelected ? kPrimaryColor : kBlackColor, 10, isSelected ? FontWeight.bold : FontWeight.w400),
                    ),
                  ],
                ),
              );
            }),
                      ),
                    ),
      ),
    );
  }
}
