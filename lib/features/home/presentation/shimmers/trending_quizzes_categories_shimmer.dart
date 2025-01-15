import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/config/countries_list.dart';
import 'package:shimmer/shimmer.dart';

class TrendingQuizzesCategoriesShimmer extends StatelessWidget {
  final int count;
  const TrendingQuizzesCategoriesShimmer({super.key, this.count = 6});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: count,
      separatorBuilder: (context, index) => SizedBox(width: 16.w),
      itemBuilder: (context, index) {
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
                Shimmer.fromColors(
                  baseColor: ShimmerConstants.baseColor,
                  highlightColor: ShimmerConstants.highlightColor,
                  child: Container(
                    width: 24.w,
                    height: 24.h,
                    color: ShimmerConstants.baseColor,
                  ),
                ),
                SizedBox(width: 8.w),
                Shimmer.fromColors(
                  baseColor: ShimmerConstants.baseColor,
                  highlightColor: ShimmerConstants.highlightColor,
                  child: Container(
                    width: 80.w,
                    height: 16.h,
                    color: ShimmerConstants.baseColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
