import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risha_app/core/enums/text_style_enum.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';

class ViewAllWithTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ViewAllWithTitleWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextWidget(
          text: title,
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              CustomTextWidget(
                text: "all".tr(context: context),
                textThemeStyle: TextThemeStyleEnum.displaySmall,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(width: 1.w),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.w,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
