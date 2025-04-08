import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/views/custom_widgets/custom_button.dart';
import 'package:supakids/views/custom_widgets/custom_header.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_images.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../../utils/app_styles.dart';
import '../../../../custom_widgets/background_container.dart';
import '../../../../custom_widgets/custom_textfield/custom_textfield.dart';
import '../../../../custom_widgets/custom_tile.dart';
import '../../../../custom_widgets/shadow_card.dart';
import '../../../../custom_widgets/small_button.dart';
import 'controller/edit_parent_profile.dart';



class EditParentProfile extends GetView<EditParentProfileController> {
  const EditParentProfile({super.key});

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
               const CustomHeader(),
                SizedBox(height: 15.h,),
                Text("$kParentEdit${controller.data['name'] ?? kParents} ", style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800)),
                SizedBox(height: 15.h,),
                Text(kParentName, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                SizedBox(height: 16.h,),
                CustomTextField(
                  fieldController : controller.nameController,
                  hintText: kName,
                ),
                SizedBox(height: 16.h,),
                Text(kEmail, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                SizedBox(height: 14.h,),
                CustomTextField(
                  fieldController : controller.emailController,
                  hintText: kEmail,
                ),
                SizedBox(height: 16.h,),
                Text(kStatus, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                SizedBox(height: 14.h,),
              Obx(() =>   CustomTile(
                label: controller.isSwitch.value ? kActive : kInactive,
                switchValue: controller.isSwitch,
                onToggle: controller.switchToggle,
                bgColor: controller.isSwitch.value ? kPrimaryColor : kRedColor,
                activeColor: kWhiteColor,
                switchColor: kPrimaryColor,
              ),),
                SizedBox(height: 16.h,),
                Text(kChildsProfiles, style: AppStyles.interStyle(kBlackColor, 16, FontWeight.w800)),
                SizedBox(height: 14.h,),
                Obx(() => Wrap(
                  children: List.generate(controller.childProfiles.length, (index) {
                    var data = controller.childProfiles[index];
                    return Padding(
                      padding:  EdgeInsets.only(bottom: 30.0.h),
                      child: ShadowCard(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 31.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(kChildIcon, width: 18.w,),
                                    SizedBox(width: 14.w,),
                                    Text(data['name'] ?? "NO Name", style: AppStyles.interStyle(kBlackColor, 14 , FontWeight.w400)),
                                  ],
                                ),
                                SizedBox(height: 11.h,),
                                Row(
                                  children: [
                                    Image.asset(kAgeIcon, width: 19.w,),
                                    SizedBox(width: 13.w,),
                                    Text('Age: ${data['age'].toString()} ', style: AppStyles.interStyle(kBlackColor, 14 , FontWeight.w400)),
                                  ],
                                ),
                                SizedBox(height: 11.h,),
                                Row(
                                  children: [
                                    Image.asset(kFavouriteIcon, width: 20.w,),
                                    SizedBox(width: 12.w,),
                                    Text('Favourite: ${data['interests'].isNotEmpty ? data['interests'].join(', ') : "No interests"}', style: AppStyles.interStyle(kBlackColor, 14 , FontWeight.w400)),
                                  ],
                                ),
                                SizedBox(height: 11.h,),
                                Row(
                                  children: [
                                    Image.asset(kMobileIcon, width: 22.w,),
                                    SizedBox(width: 9.w,),
                                    Text('Screen Time: ${kScreenTimePer}', style: AppStyles.interStyle(kBlackColor, 14 , FontWeight.w400)),
                                  ],
                                ),
                                SizedBox(height: 21.h,),
                                Row(
                                  children: [
                                    SmallButton(
                                        onTap: () => Get.toNamed(kEditPro),
                                        sizeWidth: 6.w,
                                        text: kEdit),
                                    SizedBox(width: 13.w),
                                    SmallButton(
                                      onTap: () => controller.removeProfile(index,context),
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
                          )),
                    );
                  }),
                )),

                SizedBox(height: 40.h,),
                CustomButton(
                  padding: 0,
                    text: kSave,
                    onPressed: (){
                    // print(controller.data['id']);
                      // showToast(context, msg: kChangeSaved,);
                    },
                  showIcon: false,
                ),
                SizedBox(height: 30.h,),







              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}
