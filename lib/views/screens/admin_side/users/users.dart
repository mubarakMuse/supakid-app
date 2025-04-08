import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/custom_search_field.dart';
import 'package:supakids/views/custom_widgets/small_button.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../custom_widgets/background_container.dart';
import '../../../custom_widgets/shadow_card.dart';
import 'controller/users_controller.dart';


class UsersScreens extends GetView<UserController> {
  const UsersScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h,),
                Center(child: Image.asset(kSupaLogo, width: 121.w,)),
                SizedBox(height: 15.h,),
                Text(kManageParents, style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w800),),
                SizedBox(height: 22.h,),
               const CustomSearchField(text: kSearch),
                SizedBox(height: 29.h,),
                Text(kParentsProfile, style: AppStyles.interStyle(kBlackColor, 16, FontWeight.w800),),
                SizedBox(height: 15.h,),
                Obx(() => Wrap(
                  children: List.generate(controller.allUsers.length , (index){
                    var data = controller.allUsers[index];
                    return Padding(
                      padding:  EdgeInsets.only(bottom: 30.0.h),
                      child: ShadowCard(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 31.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(kChildIcon, width: 18.w),
                                  SizedBox(width: 14.w),
                                  Text(data['name'] ?? "NO Name", style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400)),
                                ],
                              ),
                              SizedBox(height: 11.h),
                              Row(
                                children: [
                                  Image.asset(kEmailIcon, width: 19.w, color: kPrimaryColor),
                                  SizedBox(width: 14.w),
                                  Text(data['email'] ??  "NO Email", style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400)),
                                ],
                              ),
                              SizedBox(height: 11.h),
                              Row(
                                children: [
                                  Image.asset(kChildrenIcon, width: 20.w),
                                  SizedBox(width: 11.w),
                                  Text("${data['childProfiles']} $kChildProfiles", style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400)),
                                ],
                              ),
                              SizedBox(height: 11.h),
                              Padding(
                                padding:  EdgeInsets.only(left: 1.0.w),
                                child: Row(
                                  children: [
                                    Image.asset(kActiveIcon, width: 19.w),
                                    SizedBox(width: 11.w),
                                    Text('Active', style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 21.h),
                              Row(
                                children: [
                                  SmallButton(
                                      onTap: () => Get.toNamed(kEditParentProfile, arguments: data),
                                      text: kEdit,
                                    sizeWidth: 6.w,
                                  ),
                                  SizedBox(width: 13.w),
                                  SmallButton(
                                    onTap: () => controller.removeProfile(index, context),
                                    text: kDel,
                                    textColor: kBlackColor,
                                    bgColor: kNavColor,
                                    sizeWidth: 5.w,
                                    image: kDelIcon,
                                    imageSize: 18.w,
                                    imageColor: kBlackColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                )),
                SizedBox(height: 10.h,),

              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}
