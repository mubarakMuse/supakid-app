import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/views/custom_widgets/background_container.dart';
import 'package:supakids/views/custom_widgets/shadow_card.dart';
import '../../../../../../utils/app_images.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../custom_widgets/back_button.dart';
import '../../../../custom_widgets/small_button.dart';
import 'controller/all_child_profiles_controller.dart';

class AllChildProfilesScreen extends GetView<AllChildProfilesController> {
  const AllChildProfilesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundContainer(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 60.h),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const BackButtonWidget(),
                                  const SizedBox(),
                                  GestureDetector(
                                    onTap: () => Get.toNamed(kAddPro),
                                    child: Row(
                                      children: [
                                        Image.asset(kAdd, width: 16.w),
                                        SizedBox(width: 4.w),
                                        Text(
                                          kAddNewProfile,
                                          style: AppStyles.interStyle(kPrimaryColor, 10, FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:  EdgeInsets.only(right: 22.0.w),
                                child: Image.asset(kSupaLogo, width: 125.w),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Text(kManageProfiles, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                          SizedBox(height: 3.h),
                          Text(kCustomizeEach, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
                          SizedBox(height: 22.h),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                      child: Obx(() {
                        if (controller.isLoading.value) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (controller.childProfiles.isEmpty) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: AppStyles.height(context) * 0.2),
                              Image.asset(kNoChildIcon, color: kPrimaryColor, width: 70.w),
                              SizedBox(height: 11.h),
                              Center(
                                child: Text(kNoProfile, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w600),),
                              ),
                              SizedBox(height: 11.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(kClickOn, style: AppStyles.interStyle(kBlackColor, 12, FontWeight.w600),),
                                  Image.asset(kAdd, width: 16.w),
                                  Text(kOnRight, style: AppStyles.interStyle(kBlackColor, 12, FontWeight.w600),),
                                ],
                              )
                            ],
                          );
                        }
                        return Wrap(
                          runSpacing: 27,
                          children: List.generate(controller.childProfiles.length, (index) {
                            var data = controller.childProfiles[index];
                            bool isFirst = index == 0;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShadowCard(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 20.h),
                                        if (isFirst)
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(kProfileList, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                                              SizedBox(height: 10.h),
                                            ],
                                          ),
                                        Text(kProfileName, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
                                        SizedBox(height: 10.h),
                                        Text(data['name'] ?? "", style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
                                        SizedBox(height: 12.h),
                                        const Divider(color: kRedColor, height: 2, thickness: 2),
                                        SizedBox(height: 12.h),
                                        Text(kAge, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
                                        SizedBox(height: 10.h),
                                        Text("${data['age'].toString()} Years", style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
                                        SizedBox(height: 12.h),
                                        const Divider(color: kRedColor, height: 2, thickness: 2),
                                        SizedBox(height: 12.h),
                                        Text(kInterest, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
                                        SizedBox(height: 8.h),
                                        Text(
                                          data['interests'].isNotEmpty ? data['interests'].join(', ') : "No interests",
                                          style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),
                                        ),
                                        SizedBox(height: 13.h),
                                        SmallButton(
                                          onTap: () => Get.toNamed(kEditPro, arguments: data),
                                          text: kEdit,
                                          width: AppStyles.width(context) * 0.22,
                                          sizeWidth: 9.w,
                                        ),
                                        SizedBox(height: 22.h),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        );
                      }),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ],
          ),
        )
      // body: BackgroundContainer(
      //     child: SingleChildScrollView(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Padding(
      //             padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 SizedBox(height: 60.h,),
      //                 Row(
      //                   children: [
      //                     const BackButtonWidget(),
      //                     Expanded(
      //                       child: Center(
      //                         child: Image.asset(kSupaLogo, width: 125.w),
      //                       ),
      //                     ),
      //                     GestureDetector(
      //                       onTap: () => Get.toNamed(kAddPro),
      //                       child: Row(
      //                         children: [
      //                           Image.asset(kAdd, width: 16.w),
      //                           SizedBox(width: 4.w),
      //                           Text(kAddNewProfile, style: AppStyles.interStyle(kPrimaryColor, 10, FontWeight.w700),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(height: 15.h,),
      //                 Text(kManageProfiles, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
      //                 SizedBox(height: 3.h),
      //                 Text(kCustomizeEach, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
      //                 SizedBox(height: 22.h),
      //               ],
      //             ),
      //           ),
      //           Padding(
      //             padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
      //             child: Obx((){
      //               if (controller.isLoading.value) {
      //                 return const Center(child: CircularProgressIndicator());
      //               }
      //               if (controller.childProfiles.isEmpty) {
      //                 return Column(
      //                   children: [
      //                     SizedBox(height: 200.h,),
      //                     Image.asset(kNoChildIcon, color: kPrimaryColor, width: 70.w,),
      //                     SizedBox(height: 11.h,),
      //                     Center(
      //                       child: Text(
      //                         "No profile Created",
      //                         style: AppStyles.interStyle(kBlackColor, 16, FontWeight.w600),
      //                       ),
      //                     ),
      //                   ],
      //                 );
      //               }
      //                   return Wrap(
      //                 runSpacing: 27,
      //                 children:  List.generate(
      //                     controller.childProfiles.length,
      //                         (index) {
      //                       var data = controller.childProfiles[index];
      //                       bool isFirst = index == 0;
      //                       return Column(
      //                         mainAxisAlignment: MainAxisAlignment.start,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           ShadowCard(
      //                             child: Padding(
      //                               padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      //                               child: Column(
      //                                 mainAxisAlignment: MainAxisAlignment.start,
      //                                 crossAxisAlignment: CrossAxisAlignment.start,
      //                                 children: [
      //                                   SizedBox(height: 20.h),
      //                                   if (isFirst)
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.start,
      //                                       children: [
      //                                         Text(kProfileList, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
      //                                         SizedBox(height: 10.h),
      //                                       ],
      //                                     ),
      //                                   // Text(kProfileList, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
      //                                   // SizedBox(height: 10.h),
      //                                   Text(kProfileName, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
      //                                   SizedBox(height: 10.h),
      //                                   Text(data['name'] ?? "", style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
      //                                   SizedBox(height: 12.h),
      //                                   const Divider(color: kRedColor, height: 2, thickness: 2),
      //                                   SizedBox(height: 12.h),
      //                                   Text(kAge , style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
      //                                   SizedBox(height: 10.h),
      //                                   Text("${data['age'].toString()} Years", style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400)),
      //                                   SizedBox(height: 12.h),
      //                                   const Divider(color: kRedColor, height: 2, thickness: 2),
      //                                   SizedBox(height: 12.h),
      //                                   Text(kInterest, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w800)),
      //                                   SizedBox(height: 8.h),
      //                                   Text(data['interests'].isNotEmpty ? data['interests'].join(', ') : "No interests",
      //                                     style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),
      //                                   ),
      //                                   SizedBox(height: 13.h),
      //                                   SmallButton(
      //                                     onTap: () => Get.toNamed(kEditPro, arguments: data),
      //                                     text: kEdit,
      //                                     width: AppStyles.width(context) * 0.22,
      //                                     sizeWidth: 9.w,
      //                                   ),
      //                                   SizedBox(height: 22.h),
      //                                 ],
      //                               ),
      //                             ),),
      //                           // SizedBox(height: 27.h),
      //                         ],
      //                       );
      //                     }).toList(),
      //               );
      //             }),
      //           ),
      //           SizedBox(height: 30.h,)
      //
      //
      //       ],
      //       ),
      //     )
      // ),
    );
  }
}
