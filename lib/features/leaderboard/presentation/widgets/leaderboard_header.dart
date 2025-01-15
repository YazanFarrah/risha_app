import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/features/leaderboard/presentation/controllers/leaderboard_filters_controller.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class LeaderboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LeaderboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final leaderboardFiltersController =
        Get.find<LeaderboardFiltersController>();
    final userController = Get.find<CurrentUserController>();
    return AppBar(
      backgroundColor: Get.theme.colorScheme.primary,
      elevation: 4,
      shadowColor: const Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.1),
      centerTitle: true,
      title: CustomTextWidget(
        text: "leaderboard",
        color: Get.theme.colorScheme.onSurface,
      ),
      leading: Obx(
        () {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    leaderboardFiltersController.toggleLocale();
                  },
                  child: leaderboardFiltersController.isLocale.value
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                              color: Get.theme.colorScheme.onSurface,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          child: CustomTextWidget(
                            text: Get.locale?.languageCode == "ar"
                                ? userController.user.value?.country?.name_ar ??
                                    ""
                                : userController.user.value?.country?.name ??
                                    "",
                            color: Get.theme.colorScheme.onSurface,
                          ),
                        )
                      : Icon(
                          Icons.language,
                          color: Get.theme.colorScheme.onSurface,
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
