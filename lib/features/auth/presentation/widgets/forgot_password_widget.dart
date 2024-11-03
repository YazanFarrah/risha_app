import 'package:risha_app/config/asset_paths.dart';
import 'package:risha_app/core/utils/media_query.dart';
import 'package:risha_app/core/utils/responsive.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIConstants.bodyPadding,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Lottie.asset(
            AssetPaths.lockAnimation,
            width: Responsive.isTablet
                ? getWidth(context) * 0.3
                : getWidth(context) * 0.45,
          ),
          SizedBox(height: 20),
          CustomTextWidget(
            text: "forgotPasswordMessage",
            maxLines: 5,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
