import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risha_app/config/app_colors.dart';

class CircularIconWidget extends StatelessWidget {
  final Widget widget;
  const CircularIconWidget({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51.w,
      width: 51.w,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: SharedColors.blueGreyColor,
      ),
      child: Center(child: widget),
    );
  }
}
