import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/config/asset_paths.dart';
import 'package:risha_app/core/enums/text_style_enum.dart';
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
        gradient: const LinearGradient(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${"risha".tr(context: context)} ",
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
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
                      color: Theme.of(context).colorScheme.onSurface,
                      textThemeStyle: TextThemeStyleEnum.bodySmall,
                      fontWeight: FontWeight.w700,
                      maxLines: 2,
                    ),
                    if (showDetails == true)
                       CustomTextWidget(
                        text: "getRishaPlus",
                        color: Theme.of(context).colorScheme.onSurface,
                        textThemeStyle: TextThemeStyleEnum.bodySmall,
                        maxLines: 2,
                      ),
                  ],
                ),
              ],
            ),
          ),
          CustomButton(
            onPressed: () {},
            backgroundColor: Theme.of(context).colorScheme.onSurface,
            height: 34.h,
            width: 114.w,
            child: const CustomTextWidget(
              text: "subNow",
              color: SharedColors.primaryColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
