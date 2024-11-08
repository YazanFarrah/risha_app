import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/config/asset_paths.dart';
import 'package:risha_app/core/widgets/custom_button.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';

class SubscriptionWidget extends StatelessWidget {
  final double? height;
  final bool? showDetails;
  const SubscriptionWidget({
    super.key,
    this.height,
    this.showDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsetsDirectional.only(top: 10.h, bottom: 10.h, end: 14.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0XFFA997FC),
            Color(0XFF896FFF),
          ],
        ),
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            AssetPaths.crown,
            width: 75.w,
            height: 75.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${"risha".tr(context: context)} ",
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                      TextSpan(
                        text: "plus".tr(context: context),
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: SharedColors.goldColor,
                                ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "forSubPrice",
                      color: Colors.white,
                      isBodySmall: true,
                      fontWeight: FontWeight.w700,
                      maxLines: 2,
                    ),
                    if (showDetails == true)
                      CustomTextWidget(
                        text: "getRishaPlus",
                        color: Colors.white,
                        isBodySmall: true,
                        maxLines: 2,
                      ),
                  ],
                ),
              ],
            ),
          ),
          CustomButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            height: 34.h,
            width: 103.w,
            child: CustomTextWidget(
              text: "subNow",
              color: SharedColors.primaryColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
