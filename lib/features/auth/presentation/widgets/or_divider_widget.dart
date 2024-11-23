import 'package:flutter/material.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';

class OrDividerWidget extends StatelessWidget {
  final double lineThickness;
  final Color? lineColor;
  final TextStyle? textStyle;

  const OrDividerWidget({
    super.key,
    this.lineThickness = 1.0,
    this.lineColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: lineColor ?? SharedColors.greyTextColor,
            thickness: lineThickness,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomTextWidget(
            text: "or",
            color: SharedColors.greyTextColor,
          ),
        ),
        Expanded(
          child: Divider(
            color: lineColor ?? SharedColors.greyTextColor,
            thickness: lineThickness,
          ),
        ),
      ],
    );
  }
}
