import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/config/theme/text_data.dart';
import 'package:frontend/di/getx_binding_builder_call_back.dart';
import 'package:frontend/presentation/diary/diary_view_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DiaryScreen extends GetView<DiaryViewModel> {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Image noImage = Image.asset(
      'lib/config/assets/images/temp_img.png',
      width: 50,
      height: 50,
    );
    getDiaryBinding();

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffE69954), Color(0xffE4A469), Color(0xffE4A86F)],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Text(
                  DateFormat('MM월 dd일').format(controller.nowDate.value),
                  style: kSubtitle2BlackStyle,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Row(
                  children: [
                    Text(
                      "메타몽님",
                      style: kHeader1BlackStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Row(
                  children: [
                    Text(
                      "오늘 날씨 어때요?",
                      style: kHeader1BlackStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: SvgPicture.asset(
                  "lib/config/assets/images/character/onboarding1.svg",
                  width: 232.w,
                  height: 232.h,
                ),
              ),

              // Obx(
              //   () => (controller.croppedFile.value != null ||
              //           controller.pickedFile.value != null)
              //       ? Center(
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Padding(
              //                 padding:
              //                     const EdgeInsets.symmetric(horizontal: 16.0),
              //                 child: Card(
              //                   elevation: 4.0,
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(16.0),
              //                     child: controller.croppedFile.value != null
              //                         ? ConstrainedBox(
              //                             constraints: BoxConstraints(
              //                               maxWidth: 0.8,
              //                               maxHeight: 0.7,
              //                             ),
              //                             child: Image.file(
              //                               File(controller
              //                                   .croppedFile.value!.path),
              //                             ),
              //                           )
              //                         : controller.pickedFile.value != null
              //                             ? ConstrainedBox(
              //                                 constraints: BoxConstraints(
              //                                   maxWidth: 0.8,
              //                                   maxHeight: 0.7,
              //                                 ),
              //                                 child: Image.file(
              //                                   File(controller
              //                                       .pickedFile.value!.path),
              //                                 ),
              //                               )
              //                             : const SizedBox.shrink(),
              //                   ),
              //                 ),
              //               ),
              //               const SizedBox(height: 24.0),
              //               Row(
              //                 mainAxisSize: MainAxisSize.min,
              //                 children: [
              //                   FloatingActionButton(
              //                     onPressed: () {
              //                       controller.clear();
              //                     },
              //                     backgroundColor: Colors.redAccent,
              //                     tooltip: 'Delete',
              //                     child: const Icon(Icons.delete),
              //                   ),
              //                   if (controller.croppedFile.value == null)
              //                     Padding(
              //                       padding: const EdgeInsets.only(left: 32.0),
              //                       child: FloatingActionButton(
              //                         onPressed: () {
              //                           controller.cropImage();
              //                         },
              //                         backgroundColor: const Color(0xFFBC764A),
              //                         tooltip: 'Crop',
              //                         child: const Icon(Icons.crop),
              //                       ),
              //                     )
              //                 ],
              //               ),
              //             ],
              //           ),
              //         )
              //       : Center(
              //           child: Card(
              //             elevation: 4.0,
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(16.0),
              //             ),
              //             child: SizedBox(
              //               width: 100.0,
              //               height: 100.0,
              //               child: Column(
              //                 mainAxisSize: MainAxisSize.max,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Padding(
              //                     padding:
              //                         const EdgeInsets.symmetric(vertical: 24.0),
              //                     child: ElevatedButton(
              //                       onPressed: () {
              //                         controller.uploadImage();
              //                       },
              //                       child: const Text('Upload'),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              // ),
              GetBuilder<DiaryViewModel>(builder: (context) {
                return Expanded(
                  child: Stack(
                    children: controller.stackChildren,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
