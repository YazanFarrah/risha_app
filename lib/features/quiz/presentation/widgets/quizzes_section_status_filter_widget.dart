import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart'; // Assuming GetX is being used for theme access

class QuizzesSectionStatusFilterWidget extends StatelessWidget {
  final String text;
  final bool isSelected;

  const QuizzesSectionStatusFilterWidget({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 8.h),
      constraints: BoxConstraints(minWidth: 94.w),
      height: 40.h,
      decoration: BoxDecoration(
        color: isSelected
            ? Get.theme.colorScheme.primary
            : Get.theme.colorScheme.onSurface,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: CustomTextWidget(
        text: text,
        color: isSelected
            ? Get.theme.colorScheme.onSurface
            : Get.theme.colorScheme.primary,
      ),
    );
  }
}
