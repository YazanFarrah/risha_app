import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/core/routes/route_paths.dart';
import 'package:risha_app/core/utils/helper_functions.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/widgets/custom_modal_bottom_sheet.dart';
import 'package:risha_app/core/widgets/subscription_widget.dart';
import 'package:risha_app/features/account/presentation/screens/account_edit_screen.dart';
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
                  const SubscriptionWidget(showDetails: true),
                  SizedBox(height: 20.h),
                  AccountListTileWidget(
                    onTap: () {
                      Get.toNamed(RoutePaths.accountEdit);
                    },
                    leadingWidget: const CircularIconWidget(
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
                  AccountListTileWidget(
                    onTap: () {
                      HelperFunctions.showCustomModalBottomSheet(
                        context: context,
                        child: CustomModalBottomSheet(
                          title: "howToGetNickname",
                          description: Get.locale?.languageCode == "ar"
                              ? userController?.nickname?.arDescription ?? ""
                              : userController?.nickname?.description ?? "",
                          confirmButtonText: "gotIt",
                          onConfirm: () {
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                    leadingWidget: const CircularIconWidget(
                      widget: Icon(
                        Icons.badge,
                      ),
                    ),
                    title: Get.locale?.languageCode == "ar"
                        ? userController?.nickname?.arTitle ?? ""
                        : userController?.nickname?.title ?? "",
                    subTitle: Get.locale?.languageCode == "ar"
                        ? userController?.nickname?.arDescription ?? ""
                        : userController?.nickname?.description ?? "",
                    trailingWidget: Icon(
                      Icons.info,
                      size: 24.w,
                      color: SharedColors.greyTextColor,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  AccountListTileWidget(
                    leadingWidget: const CircularIconWidget(
                      widget: Icon(CupertinoIcons.chart_bar_fill),
                    ),
                    title: "statisticsTitle",
                    subTitle: "statisticsDescription",
                    trailingWidget: Icon(
                      Icons.arrow_forward_ios,
                      size: 24.w,
                      color: SharedColors.greyTextColor,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  AccountListTileWidget(
                    onTap: () => Get.toNamed(RoutePaths.settings),
                    leadingWidget: const CircularIconWidget(
                      widget: Icon(Icons.settings),
                    ),
                    title: "settings",
                    subTitle: "settingsDescription",
                    trailingWidget: Icon(
                      Icons.arrow_forward_ios,
                      size: 24.w,
                      color: SharedColors.greyTextColor,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  AccountListTileWidget(
                    leadingWidget: CircularIconWidget(
                      widget: Icon(
                        Icons.store,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                    title: "currencyStoreTitle",
                    subTitle: "currencyStoreDescription",
                    trailingWidget: Icon(
                      Icons.arrow_forward_ios,
                      size: 24.w,
                      color: SharedColors.greyTextColor,
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
