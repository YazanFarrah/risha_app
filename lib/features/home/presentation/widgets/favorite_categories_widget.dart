import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Trans;
import 'package:risha_app/core/enums/text_style_enum.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/features/home/presentation/widgets/progress_indicator_widget.dart';
import 'package:risha_app/features/shared/presentation/widgets/rating_stars_widget.dart';

class FavoriteCategoriesWidget extends StatelessWidget {
  const FavoriteCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CustomTextWidget(
              text: "favCategories",
            ),
            const Spacer(),
            CustomTextWidget(
              text: "edit".tr(context: context),
              textThemeStyle: TextThemeStyleEnum.displaySmall,
              color: Get.theme.colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(width: 1.w),
            Icon(
              Icons.edit,
              size: 15.w,
              color: Get.theme.colorScheme.primary,
            ),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 127.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Get.theme.colorScheme.onSurface,
              ),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.cases_outlined,
                      color: Colors.red,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 12.h),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextWidget(text: "علوم", color: Colors.red),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            const Expanded(
                              child: ProgressIndicatorWidget(
                                color: Colors.red,
                                percentage: 47,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            const CustomTextWidget(
                              text: "47 %",
                              color: Colors.red,
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        const CustomTextWidget(
                          text: "مجموع الاختبارات 156",
                          textThemeStyle: TextThemeStyleEnum.bodySmall,
                        ),
                        SizedBox(height: 3.h),
                        const CustomTextWidget(
                          text: "المتبقي 47",
                          textThemeStyle: TextThemeStyleEnum.bodySmall,
                        ),
                        SizedBox(height: 3.h),
                        const Row(
                          children: [
                            CustomTextWidget(
                              text: "التقييم",
                              textThemeStyle: TextThemeStyleEnum.bodySmall,
                            ),
                            RatingStarsWidget(
                              rating: 4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: 3,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.h);
          },
        )
      ],
    );
  }
}
