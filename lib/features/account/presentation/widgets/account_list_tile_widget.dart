import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';

class AccountListTileWidget extends StatelessWidget {
  final Widget leadingWidget;
  final String title;
  final String subTitle;
  final Widget trailingWidget;
  const AccountListTileWidget({
    super.key,
    required this.leadingWidget,
    required this.title,
    required this.subTitle,
    required this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      child: ListTile(
        minVerticalPadding: 20.h,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: leadingWidget,
        ),
        title: CustomTextWidget(
          text: title,
        ),
        subtitle: CustomTextWidget(
          text: subTitle,
          isDisplaySmall: true,
        ),
        trailing: trailingWidget,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
