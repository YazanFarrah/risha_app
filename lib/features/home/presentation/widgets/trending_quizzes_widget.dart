import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/config/asset_paths.dart';
import 'package:risha_app/core/enums/text_style_enum.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/features/shared/presentation/widgets/rating_stars_widget.dart';

class TrendingQuizzesWidget extends StatelessWidget {
  final String title;
  final String points;
  final String subs;
  final Color color;
  final IconData icon;
  const TrendingQuizzesWidget({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
    required this.points,
    required this.subs,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        constraints: BoxConstraints(minWidth: 153.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Theme.of(context).colorScheme.onSurface,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: title,
                    color: color,
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetPaths.diamond,
                        height: 15.w,
                        width: 15.w,
                      ),
                      SizedBox(width: 6.w),
                      CustomTextWidget(
                        text: points,
                        color: color,
                        textThemeStyle: TextThemeStyleEnum.displaySmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetPaths.people,
                        height: 15.w,
                        width: 15.w,
                      ),
                      SizedBox(width: 6.w),
                      CustomTextWidget(
                        text: subs,
                        color: color,
                        textThemeStyle: TextThemeStyleEnum.displaySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            const Divider(
              height: 0,
              color: SharedColors.greyTextColor,
              thickness: .5,
            ),
            SizedBox(height: 6.h),
            const Center(child: RatingStarsWidget(rating: 3.5)),
          ],
        ),
      ),
    );
  }
}
