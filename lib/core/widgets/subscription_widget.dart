import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/config/asset_paths.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';

class SubscriptionWidget extends StatelessWidget {
  const SubscriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0XFFA997FC),
            Color(0XFF896FFF),
          ],
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            AssetPaths.crown,
            width: 75.w,
            height: 75.w,
          ),
          Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "ريشة",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    TextSpan(
                      text: "بلس",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: SharedColors.goldColor,
                          ),
                    ),
                  ],
                ),
              ),
              CustomTextWidget(
                text: "forSubPrice",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
