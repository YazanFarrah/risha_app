import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risha_app/config/app_colors.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double percentage;
  final Color color;

  const ProgressIndicatorWidget({
    super.key,
    required this.percentage,
    required this.color,
  }) : assert(percentage >= 0 && percentage <= 100,
            'Percentage must be between 0 and 100');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10.h,
      decoration: BoxDecoration(
        color: SharedColors.grayColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: percentage / 100,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
