import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';

class TrendingQuizzesCategoriesWidget extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  const TrendingQuizzesCategoriesWidget({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        constraints: BoxConstraints(minWidth: 124.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Theme.of(context).colorScheme.onSurface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24.sp,
              color: color,
            ),
            SizedBox(width: 8.w),
            CustomTextWidget(text: title, color: color)
          ],
        ),
      ),
    );
  }
}
