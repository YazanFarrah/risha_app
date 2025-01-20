import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/enums/text_style_enum.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';

class AccountListTileWidget extends StatelessWidget {
  final Widget leadingWidget;
  final String title;
  final String subTitle;
  final Widget trailingWidget;
  final GestureTapCallback? onTap;
  const AccountListTileWidget({
    super.key,
    required this.leadingWidget,
    required this.title,
    required this.subTitle,
    required this.trailingWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.zero,
        color: Get.theme.colorScheme.onSurface,
        elevation: 0,
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
            textThemeStyle: TextThemeStyleEnum.displaySmall,
            maxLines: 3,
          ),
          trailing: trailingWidget,
          contentPadding: EdgeInsetsDirectional.only(end: 6.w),
        ),
      ),
    );
  }
}
