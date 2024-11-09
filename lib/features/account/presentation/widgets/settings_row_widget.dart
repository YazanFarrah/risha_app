import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';

class SettingsRowWidget extends StatelessWidget {
  final Function()? onTap;
  final Widget leadingWidget;
  final String text;
  final Widget trailingWidget;

  const SettingsRowWidget({
    super.key,
    required this.leadingWidget,
    required this.text,
    required this.trailingWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          leadingWidget,
          SizedBox(width: 12.w),
          Expanded(
            child: CustomTextWidget(
              text: text,
              fontSize: 14,
              maxLines: 2,
            ),
          ),
          trailingWidget,
        ],
      ),
    );
  }
}
