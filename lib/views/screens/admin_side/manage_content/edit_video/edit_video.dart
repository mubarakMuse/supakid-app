import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_strings.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/common_code.dart';
import 'package:supakids/views/custom_widgets/custom_header.dart';
import 'package:supakids/views/screens/admin_side/manage_content/edit_video/controller/edit_video_controller.dart';
import '../../../../custom_widgets/background_container.dart';
import '../../../../custom_widgets/custom_button.dart';
import '../../../../custom_widgets/custom_textfield/custom_textfield.dart';
import '../../../../custom_widgets/dropdown.dart';



class EditVideoScreen extends GetView<EditVideoController> {
  const EditVideoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CommonCode.unFocus(context),
      child: Scaffold(
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
                  Text(kEditVideoDetails, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800),),
                  SizedBox(height: 3.h,),
                  Text(kEditDetails, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                  SizedBox(height: 17.h),
                  Text(kYoutubeLink, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                  SizedBox(height: 14.h,),
                  Obx(() =>  CustomTextField(
                    fieldController : controller.linkController,
                    hintText: kLink,
                    errorText: controller.linkError.value.isNotEmpty ? controller.linkError.value : null,

                  ), ),
                  SizedBox(height: 17.h),
                  Text(kEnterTitle, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                  SizedBox(height: 14.h,),
                  Obx(() =>  CustomTextField(
                    fieldController : controller.titleController,
                    hintText: kTitle,
                    errorText: controller.titleError.value.isNotEmpty ? controller.titleError.value : null,

                  ),),
                  SizedBox(height: 17.h),
                  Text(kEnterDescription, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                  SizedBox(height: 14.h,),
                  Obx(() => CustomTextField(
                    fieldController : controller.descriptionController,
                    hintText: kDescription3,
                    maxLines: 4,
                    padding: const  EdgeInsets.symmetric(horizontal: 15, vertical: 15 ),
                    errorText: controller.descriptionError.value.isNotEmpty ? controller.descriptionError.value : null,

                  ),),

                  SizedBox(height: 17.h),
                  Text(kCategory , style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                  SizedBox(height: 14.h,),
                  Obx(() =>  Dropdown(
                    value: controller.selectedCategory.value.isEmpty
                        ? null
                        : controller.selectedCategory.value,
                    items: controller.items,
                    onChanged: (String? newValue) {
                      controller.selectedCategory.value = newValue ?? '';
                      controller.dropdownError.value = '';
                    },
                    errorText: controller.dropdownError.value.isEmpty ? controller.dropdownError.value : null,
                  )),
                  SizedBox(height: 17.h),
                  Text(kContentType, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                  SizedBox(height: 14.h,),
                  Obx(() =>  Dropdown(
                    value: controller.selectedContent.value.isEmpty
                        ? null
                        : controller.selectedContent.value,
                    items: controller.list,
                    text: kSelectContentType,
                    onChanged: (String? newValue) {
                      controller.selectedContent.value = newValue ?? kMatured;
                    },)),
                  SizedBox(height: 30.h,),
                  CustomButton(
                    text: kSave,
                    onPressed: () {
                      controller.editVideo(context);
                      // Get.back();
                      // showToast(context, msg: kVideoSubmit,);
                    },
                    isLoading: controller.isLoading.value,
                    showIcon: false,
                    padding: 0,
                  ),
                  SizedBox(height: 10.h,),
                  Center(
                    child: TextButton(
                      onPressed: () =>  Get.back(),
                      child: Text(kCancel, style: AppStyles.interStyle(kRedColor, 12, FontWeight.w400),),
                    ),
                  ),
                  SizedBox(height: 33.h,),

                ],
              ),
            ),
          ),
        )
        ,
      ),
    );
  }
}
