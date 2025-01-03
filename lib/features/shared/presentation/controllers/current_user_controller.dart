import 'dart:developer';
import 'package:risha_app/core/routes/route_paths.dart';
import 'package:risha_app/core/services/hive_services.dart';
import 'package:risha_app/features/auth/data/models/user_model.dart';
import 'package:get/get.dart';
import 'package:risha_app/features/shared/data/datasources/shared_remote_datasources.dart';

class CurrentUserController extends GetxController {
  final user = Rxn<UserModel>();
  final _hiveService = Get.find<HiveServices>();
  final _sharedRemoteDatasource = Get.find<SharedRemoteDatasources>();

  void setUser(UserModel user) {
    this.user.value = user;
    log(this.user.toString());
  }

  // void updateAvatarUrl(String? newUrl) {
  //   user.value = user.value?.copyWith(avatarUrl: newUrl);
  //   tempAvatarPath.value = null;
  // }

  Future<void> getUser() async {
    final res = await _sharedRemoteDatasource.getUserData();
    res.fold((l) {
      Get.offAllNamed(RoutePaths.login);
    }, (r) {
      setUser(r);
    });
  }

  void logUserOut() {
    _hiveService.clearPreferences();
    user.value = null;
    Get.offAllNamed(RoutePaths.login);
  }
}
