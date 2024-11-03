import 'dart:developer';
import 'package:risha_app/core/errors/strings.dart';
import 'package:risha_app/core/network/network_info.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';
import 'package:risha_app/core/routes/route_paths.dart';
import 'package:risha_app/core/services/hive_services.dart';
import 'package:risha_app/core/utils/toast_utils.dart';
import 'package:get/get.dart';
import 'package:risha_app/features/auth/data/datasources/auth_remote_datasource.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final _authRemoteDatasource = Get.find<AuthRemoteDatasource>();
  final _currentUserController = Get.find<CurrentUserController>();
  final _hiveServices = Get.find<HiveServices>();
  final _networkService = Get.find<NetworkService>();

  void updateLoading(bool val) {
    isLoading.value = val;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    if (!await _networkService.isConnected) {
      return ToastUtils.showError(noInternetConnection);
    }
    updateLoading(true);
    final res = await _authRemoteDatasource.login(
      email,
      password,
    );
    res.fold((l) {
      ToastUtils.showError(l.message);
    }, (r) {
      _hiveServices.setToken(r.token);
      log(r.token.toString());
      _currentUserController.setUser(r);
      Get.offAllNamed(RoutePaths.navScreen);
    });
    updateLoading(false);
  }

  Future<void> signup({
    required String fullName,
    required String email,
    required String password,
  }) async {
    if (!await _networkService.isConnected) {
      return ToastUtils.showError(noInternetConnection);
    }
    updateLoading(true);
    final res = await _authRemoteDatasource.signup(
      fullName,
      email,
      password,
    );
    res.fold((l) {
      ToastUtils.showError(l.message);
    }, (r) {
      _hiveServices.setToken(r.token);
      log(r.token.toString());
      _currentUserController.setUser(r);
      Get.offAllNamed(RoutePaths.navScreen);
    });
    updateLoading(false);
  }
}
