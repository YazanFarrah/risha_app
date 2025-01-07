import 'package:risha_app/features/account/data/datasources/account_remote_datasource.dart';
import 'package:risha_app/features/leaderboard/presentation/controllers/leaderboard_filters_controller.dart';
import 'package:risha_app/features/shared/data/datasources/shared_remote_datasources.dart';
import 'package:risha_app/features/shared/presentation/controllers/app_theme_controller.dart';
import 'package:risha_app/features/shared/presentation/controllers/bottom_nav_bar_controller.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';
import 'package:risha_app/core/network/network_controller.dart';
import 'package:risha_app/core/services/hive_services.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.put<HiveServices>(HiveServices(), permanent: true);

    Get.put<BottomNavController>(BottomNavController(), permanent: true);

    Get.put<NetworkController>(NetworkController(), permanent: true);

    Get.put<SharedRemoteDatasources>(
      SharedRemoteDatasources(),
      permanent: true,
    );

    Get.put<CurrentUserController>(CurrentUserController(), permanent: true);

    Get.put<ThemeController>(ThemeController(), permanent: true);

    Get.put<AccountRemoteDatasource>(
      AccountRemoteDatasource(),
      permanent: true,
    );

    Get.put<LeaderboardFiltersController>(
      LeaderboardFiltersController(),
      permanent: true,
    );

    // profile

    // Get.put<InAppReviewService>(InAppReviewService(), permanent: true);
  }
}
