import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';

import 'package:risha_app/features/leaderboard/presentation/controllers/leaderboard_filters_controller.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class LeaderboardHeader extends StatelessWidget {
  const LeaderboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.sh,
      color: Theme.of(context).colorScheme.primary,
      child: Obx(
        () {
          final leaderboardFiltersController =
              Get.find<LeaderboardFiltersController>();
          final userController = Get.find<CurrentUserController>();
          return Column(
            children: [
              Row(
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
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            child: CustomTextWidget(
                              text: Get.locale?.languageCode == "ar"
                                  ? userController
                                          .user.value?.country?.name_ar ??
                                      ""
                                  : userController.user.value?.country?.name ??
                                      "",
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          )
                        : Icon(
                            Icons.language,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                  ),
                 
                  // Spacer to push the "leaderboard" text to the center
                  Expanded(
                    child: CustomTextWidget(
                      text: "leaderboard",
                      textAlign: TextAlign.center,
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Row(),
            ],
          );
        },
      ),
    );
  }
}
