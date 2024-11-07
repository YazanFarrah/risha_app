import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/core/widgets/subscription_widget.dart';
import 'package:risha_app/features/account/presentation/widgets/account_list_tile_widget.dart';
import 'package:risha_app/features/account/presentation/widgets/circular_icon_widget.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: UIConstants.bodyPadding,
          child: Obx(
            () {
              final userController =
                  Get.find<CurrentUserController>().user.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubscriptionWidget(showDetails: true),
                  SizedBox(height: 20.h),
                  AccountListTileWidget(
                    leadingWidget: CircularIconWidget(
                      widget: Icon(
                        Icons.person,
                      ),
                    ),
                    title: userController?.name ?? "",
                    subTitle: context.locale.languageCode == "ar"
                        ? "${userController?.username}@"
                        : "@${userController?.username}",
                    trailingWidget: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 24.w,
                        color: SharedColors.greyTextColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  CustomTextWidget(
                    text: "nickName",
                    color: SharedColors.greyTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 8.h),
                  AccountListTileWidget(
                    leadingWidget: CircularIconWidget(
                      widget: Icon(
                        Icons.person,
                      ),
                    ),
                    title: userController?.name ?? "",
                    subTitle: context.locale.languageCode == "ar"
                        ? "${userController?.username}@"
                        : "@${userController?.username}",
                    trailingWidget: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info,
                        size: 24.w,
                        color: SharedColors.greyTextColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  AccountListTileWidget(
                    leadingWidget: CircularIconWidget(
                      widget: Icon(
                        Icons.person,
                      ),
                    ),
                    title: userController?.name ?? "",
                    subTitle: context.locale.languageCode == "ar"
                        ? "${userController?.username}@"
                        : "@${userController?.username}",
                    trailingWidget: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info,
                        size: 24.w,
                        color: SharedColors.greyTextColor,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
