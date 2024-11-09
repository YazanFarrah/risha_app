import 'package:risha_app/features/shared/presentation/controllers/app_theme_controller.dart';
import 'package:risha_app/features/shared/presentation/controllers/bottom_nav_bar_controller.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';
import 'package:risha_app/core/network/network_controller.dart';
import 'package:risha_app/core/network/network_info.dart';
import 'package:risha_app/core/services/hive_services.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.put<HiveServices>(HiveServices(), permanent: true);

    Get.put<BottomNavController>(BottomNavController(), permanent: true);

    Get.put<NetworkController>(NetworkController(), permanent: true);

    Get.put<NetworkService>(NetworkService.instance);

    Get.put<CurrentUserController>(CurrentUserController(), permanent: true);
    
    Get.put<ThemeController>(ThemeController(), permanent: true);

    // profile

    // Get.put<InAppReviewService>(InAppReviewService(), permanent: true);
  }
}
