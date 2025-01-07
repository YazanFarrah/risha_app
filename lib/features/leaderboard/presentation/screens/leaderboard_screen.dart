import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/features/leaderboard/presentation/controllers/leaderboard_filters_controller.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Apply system UI overlay style
    Future.delayed(const Duration(milliseconds: 1)).then(
      (value) => SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.red,
          statusBarColor: Colors.red,
          systemNavigationBarDividerColor: Colors.red,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
    );

    final leaderboardFiltersController =
        Get.find<LeaderboardFiltersController>();
    final userController = Get.find<CurrentUserController>();

    return Scaffold(
      body: Column(
        children: [
          // Custom Header Container
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: SafeArea(
              bottom: false,
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
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.h),
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
                  CustomTextWidget(
                    text: "leaderboard",
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  const SizedBox(width: 40), // Placeholder for spacing
                ],
              ),
            ),
          ),
          // Body Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
