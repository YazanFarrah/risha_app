import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risha_app/config/app_colors.dart';

class RatingStarsWidget extends StatelessWidget {
  final double rating;
  final Color? color;
  final double? size;

  const RatingStarsWidget({
    super.key,
    required this.rating,
    this.color,
    this.size,
  });

  final goldColor = SharedColors.goldColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          // Full star
          return Icon(
            Icons.star,
            color: color ?? goldColor,
            size: size ?? 16.w,
          );
        } else if (index < rating) {
          // Half star
          return Icon(
            Icons.star_half,
            color: color ?? goldColor,
            size: size ?? 16.w,
          );
        } else {
          // Empty star
          return Icon(
            Icons.star_border,
            color: color ?? goldColor,
            size: size ?? 16.w,
          );
        }
      }),
    );
  }
}
