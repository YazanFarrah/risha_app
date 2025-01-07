// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:risha_app/config/asset_paths.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
            height: 45.h,
            color: const Color(0XFF7F64FF),
          ),
          Padding(
            padding: UIConstants.horizontalPadding,
            child: Obx(
              () {
                final userController =
                    Get.find<CurrentUserController>().user.value;
                return Column(
                  children: [
                    // Row 1
                    Row(
                      spacing: 12.w,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(minHeight: 75.h),
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSurface,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8.h,
                              children: [
                                CustomTextWidget(
                                  text: "rank",
                                  maxLines: 2,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 6.w,
                                  children: [
                                    SvgPicture.asset(AssetPaths.rank, height: 21.w,
                                      width: 21.w,),
                                    CustomTextWidget(
                                      text:
                                          userController?.rank.toString() ?? "",
                                      maxLines: 2,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(minHeight: 75.h),
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSurface,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8.h,
                              children: [
                                CustomTextWidget(
                                  text: "points",
                                  maxLines: 2,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 6.w,
                                  children: [
                                    SvgPicture.asset(
                                      AssetPaths.diamond,
                                      height: 21.w,
                                      width: 21.w,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    CustomTextWidget(
                                      text: userController?.totalPoints
                                              .toString() ??
                                          "",
                                      maxLines: 2,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h), // Spacing between rows
                    // Row 2
                    Row(
                      spacing: 12.w,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(minHeight: 75.h),
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSurface,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8.h,
                              children: [
                                CustomTextWidget(
                                  text: "coins",
                                  maxLines: 2,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 6.w,
                                  children: [
                                    SvgPicture.asset(
                                      AssetPaths.coins,
                                      height: 21.w,
                                      width: 21.w,
                                    ),
                                    CustomTextWidget(
                                      text: userController?.coins != 0
                                          ? "${userController?.coins}X"
                                          : "",
                                      maxLines: 2,
                                      color: const Color(0XFFF6AF02),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(minHeight: 75.h),
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSurface,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8.h,
                              children: [
                                CustomTextWidget(
                                  text: "strike",
                                  maxLines: 2,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 6.w,
                                  children: [
                                    SvgPicture.asset(
                                      AssetPaths.strike,
                                      height: 21.w,
                                      width: 21.w,
                                    ),
                                    CustomTextWidget(
                                      text:
                                          userController?.strike?.toString() ??
                                              "0",
                                      maxLines: 2,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h), // Spacing between rows
                    // Row 3
                    Row(
                      spacing: 12.w,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(minHeight: 75.h),
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSurface,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextWidget(
                                  text: userController?.totalCorrectAnswers
                                          ?.toString() ??
                                      "0",
                                  maxLines: 2,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiary,
                                ),
                                SizedBox(width: 18.w),
                                SizedBox(
                                  height: 32.h,
                                  
                                  child: VerticalDivider(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary,
                                    thickness: 2.5,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (Get.locale?.languageCode ==
                                        "en") ...{
                                      CustomTextWidget(
                                        text: "Correct",
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                      ),
                                      CustomTextWidget(
                                        text: "Answers",
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    } else ...{
                                      CustomTextWidget(
                                        text: "الأجوبة",
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      
                                      CustomTextWidget(
                                        text: "الصحيحة",
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                      ),
                                    }
                                  ],
                                ),
                              ],
                            ),
                          
                          ),
                        ),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(minHeight: 75.h),
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSurface,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextWidget(
                                  text: userController?.totalCorrectAnswers
                                          ?.toString() ??
                                      "0",
                                  maxLines: 2,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .error,
                                ),
                                SizedBox(width: 18.w),
                                SizedBox(
                                  height: 32.h,
                                  
                                  child: VerticalDivider(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .error,
                                    thickness: 2.5,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (Get.locale?.languageCode ==
                                        "en") ...{
                                      CustomTextWidget(
                                        text: "Wrong",
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error,
                                      ),
                                      CustomTextWidget(
                                        text: "Answers",
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    } else ...{
                                      CustomTextWidget(
                                        text: "الأجوبة",
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      
                                      CustomTextWidget(
                                        text: "الخاطئة",
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error,
                                      ),
                                    }
                                  ],
                                ),
                              ],
                            ),
                          
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
