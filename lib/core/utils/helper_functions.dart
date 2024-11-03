import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class HelperFunctions {
  static String truncateText(String text, int maxLength) {
    return text.length > maxLength
        ? '${text.substring(0, maxLength)}...'
        : text;
  }

  static Future<void> showCustomModalBottomSheet({
    required BuildContext context,
    required Widget child,
    bool showDragHandler = false,
  }) async {
    showModalBottomSheet(
      showDragHandle: showDragHandler,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
          ),
          child: child,
        );
      },
    );
  }

  static Future<void> showLogoutDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Center(
            child: CustomTextWidget(
              text: 'Logout',
              isHeadlineMedium: true,
            ),
          ),
          content: CustomTextWidget(
            text: 'Are you sure you want to log out?',
            color: SharedColors.greyTextColor,
          ),
          actions: [
            TextButton(
              child: const CustomTextWidget(text: 'Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const CustomTextWidget(text: 'Logout'),
              onPressed: () {
                Navigator.of(context).pop(true);
                Get.back();
                // context.read<CurrentUserProvider>().clearUser();
              },
            ),
          ],
        );
      },
    );
  }
}
