import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/utils/color_utils.dart';
import 'package:risha_app/core/widgets/custom_image.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/features/home/data/models/trendy_quizzes_model.dart';

class TrendingQuizzesCategoriesWidget extends StatelessWidget {
  final TrendyQuizzesModel trendyQuizzesModel;
  const TrendingQuizzesCategoriesWidget({
    super.key,
    required this.trendyQuizzesModel,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        constraints: BoxConstraints(minWidth: 124.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Get.theme.colorScheme.onSurface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(image: trendyQuizzesModel.icon),
            SizedBox(width: 8.w),
            CustomTextWidget(
              text: Get.locale?.languageCode == "ar"
                  ? trendyQuizzesModel.arName
                  : trendyQuizzesModel.enName,
              color: ColorUtils.hexToColor(
                trendyQuizzesModel.colorCode,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
