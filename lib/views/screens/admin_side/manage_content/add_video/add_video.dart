import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_strings.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/common_code.dart';
import 'package:supakids/views/custom_widgets/shadow_card.dart';
import 'package:supakids/views/screens/admin_side/manage_content/add_video/controller/add_video_controller.dart';
import '../../../../../utils/app_images.dart';
import '../../../../custom_widgets/back_button.dart';
import '../../../../custom_widgets/background_container.dart';
import '../../../../custom_widgets/custom_button.dart';
import '../../../../custom_widgets/custom_textfield/custom_textfield.dart';
import '../../../../custom_widgets/dropdown.dart';


class AddVideoScreen extends GetView<AddVideoController> {
  const AddVideoScreen({super.key});

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
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BackButtonWidget(),
                          const SizedBox(),
                          GestureDetector(
                            onTap: () {
                              controller.toggleUI();
                            },
                            child: Row(
                              children: [
                                Image.asset(kAdd, width: 16.w),
                                SizedBox(width: 4.w),
                                Obx(() => Text( controller.isExpanded.value ?  kUploadVideo  : kAddVideosBulk, style: AppStyles.interStyle(kPrimaryColor, 10, FontWeight.w700),),)
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
                 Obx(() => controller.isExpanded.value ?
                  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 15.h,),
                     Text(kUploadVideoFile, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800),),
                     SizedBox(height: 3.h,),
                     Text(kCvsFile, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
                     SizedBox(height: 30.h,),
                     DottedBorder(
                       borderType: BorderType.RRect,
                       radius: const Radius.circular(12),
                       padding: const EdgeInsets.all(6),
                       color: kMidGreyColor,
                       child: ClipRRect(
                         borderRadius: const BorderRadius.all(Radius.circular(12)),
                         child: Container(
                           height: 185.h,
                           width: AppStyles.width(context),
                           color: kChartBColor,
                           child: Column(
                             children: [
                               SizedBox(height: 20.h,),
                               const Icon(Icons.cloud_upload_outlined, size: 25, color: kPrimaryColor,),
                               SizedBox(height: 12.h,),
                               Text('Choose a file or drag & drop it here',style: AppStyles.interStyle(kBlackColor, 12, FontWeight.w700 )),
                               SizedBox(height: 5.h,),
                               Text('File type must be in *CSV format',style: AppStyles.interStyle(kMidGreyColor, 10, FontWeight.w400)),
                               SizedBox(height: 20.h,),
                               GestureDetector(
                                 onTap: controller.pickFile,
                                 child: Container(
                                   height: 42.h,
                                   width: 100.w,
                                   decoration: BoxDecoration(
                                       border: Border.all(
                                         color: kMidGreyColor,
                                       ),
                                       borderRadius: BorderRadius.circular(10)
                                   ),
                                   child: Center(child: Text('Browse',style: AppStyles.interStyle(kMidGreyColor, 12, FontWeight.w400))),
                                 ),
                               ),
                               SizedBox(height: 20.h,),

                             ],
                           ),
                         ),
                       ),
                     ),
                     SizedBox(height: 50.h,),
                     Stack(
                       children: [
                         ShadowCard(
                           height: 70.h,
                           borderRadius: 10,
                           child: Row(
                             children: [
                               Image.asset(kCsvIcon, width: 70.w),
                               SizedBox(width: 20.w),
                               Expanded(
                                 child: Obx(() => Text(
                                   controller.fileName.value.isEmpty ? kNoSelected : controller.fileName.value,
                                   style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w400),
                                   overflow: TextOverflow.ellipsis,
                                 )),
                               ),
                             ],
                           ),
                         ),
                         Obx(() => controller.fileName.value.isNotEmpty
                             ? Positioned(
                           top: 10.h,
                           right: 10.w,
                           child: GestureDetector(
                             onTap: () {
                               controller.fileName.value = '';
                             },
                             child: Container(
                               height: 22.h,
                               width: 22.w,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 border: Border.all(color: kBlackColor),
                               ),
                               child: Center(child: Icon(Icons.close, color: kBlackColor, size: 14.w)),
                             ),
                           ),
                         )
                             : const SizedBox.shrink(),
                         )

                       ],
                     ),
                     SizedBox(height: 200.h,),
                     CustomButton(
                       text: kPost,
                       onPressed: () {
                         controller.postBulkVideo(context);
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
                     // ElevatedButton(
                     //   onPressed: controller.pickFile,
                     //   child: Text("Select CSV File"),
                     // ),
                     // SizedBox(height: 20),
                     // Obx(() => Text(
                     //   controller.fileName.value.isEmpty
                     //       ? "No file selected"
                     //       : "Selected: ${controller.fileName.value}",
                     //   style: TextStyle(fontSize: 16),
                     // )),
                     // SizedBox(height: 20),
                     // ElevatedButton(
                     //   onPressed: controller.uploadVideos,
                     //   child: Obx(() =>
                     //   controller.isLoading.value ? CircularProgressIndicator() : Text("Upload Videos")),
                     // ),
                   ],
                 )
                     :   Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       SizedBox(height: 15.h,),
                     Text(kEnterVideoDetails, style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800),),
                     SizedBox(height: 3.h,),
                     Text(kProvideDetails, style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w400),),
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
                       hintText: kDescription,
                       maxLines: 4,
                       padding: const  EdgeInsets.symmetric(horizontal: 15, vertical: 15 ),
                       errorText: controller.descriptionError.value.isNotEmpty ? controller.descriptionError.value : null,

                     ),),
                     SizedBox(height: 17.h),
                     Text(kCategory , style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                     SizedBox(height: 14.h,),
                     Obx(() =>  Dropdown(
                       value: controller.selectedValue.value.isEmpty
                           ? null
                           : controller.selectedValue.value,
                       items: controller.category,
                       onChanged: (String? newValue) {
                         controller.selectedValue.value = newValue ?? '';
                         controller.dropdownError.value = '';
                       },
                     )),
                     SizedBox(height: 17.h),
                     Text(kContentType, style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
                     SizedBox(height: 14.h,),
                     Obx(() =>  Dropdown(
                       value: controller.selectedList.value.isEmpty
                           ? null
                           : controller.selectedList.value,
                       items: controller.content,
                       text: kSelectContentType,
                       onChanged: (String? newValue) {
                         controller.selectedList.value = newValue ?? '';
                       },)),
                     SizedBox(height: 30.h,),
                     CustomButton(
                       text: kPost,
                       onPressed: () {
                         controller.postVideo(context);
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
                 )
                 ),
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
