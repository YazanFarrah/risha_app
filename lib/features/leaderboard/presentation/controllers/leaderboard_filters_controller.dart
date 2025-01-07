import 'package:get/get.dart';
import 'package:risha_app/core/routes/route_paths.dart';
import 'package:risha_app/core/utils/toast_utils.dart';
import 'package:risha_app/features/leaderboard/enums/leaderboard_filter_time_enum.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class LeaderboardFiltersController extends GetxController {
  final isLocale = false.obs;
  final timeFilter = LeaderboardFilterTimeEnum.allTime.obs;
  final _userController = Get.find<CurrentUserController>();

  void changeTimeFilter(LeaderboardFilterTimeEnum time) {
    timeFilter(time);
  }

  void toggleLocale() {
    if (_userController.user.value?.country == null &&
        isLocale.value == false) {
      ToastUtils.showError("pleaseSelectYourCountryFirst");
      Get.toNamed(RoutePaths.accountEdit);
      return;
    }
    //TODO: implement api call here
    isLocale(!isLocale.value);
  }
}
