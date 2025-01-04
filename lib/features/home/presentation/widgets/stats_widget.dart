import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';

class StatsWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? svgString;
  final int number;
  const StatsWidget({
    super.key,
    required this.title,
    this.svgString,
    required this.number,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: CustomTextWidget(
          text: title,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
