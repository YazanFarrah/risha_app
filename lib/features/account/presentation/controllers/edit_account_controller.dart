import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import 'package:risha_app/core/errors/strings.dart';
import 'package:risha_app/core/network/network_info.dart';
import 'package:risha_app/core/utils/toast_utils.dart';
import 'package:risha_app/features/account/data/datasources/account_remote_datasource.dart';
import 'package:risha_app/features/auth/data/models/user_model.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class EditAccountController extends GetxController {
  final RxBool isLoading = false.obs;
  final tempAvatarPath = Rxn<String>();
  final _networkService = Get.find<NetworkService>();
  final _accountRemoteDatasource = Get.find<AccountRemoteDatasource>();
  final _currentUserController = Get.find<CurrentUserController>();
  void updateLoading(bool val) {
    isLoading.value = val;
  }

  void updateTempAvatarPath(String? path) {
    tempAvatarPath.value = path;
  }

  void updateUser(UserModel user) async {
    if (!await _networkService.isConnected) {
      return ToastUtils.showError(noInternetConnection);
    }
    updateLoading(true);
    final res = await _accountRemoteDatasource.updateAccount(user);
    res.fold((l) {
      ToastUtils.showError(l.message);
    }, (r) async {
      _currentUserController.setUser(r);
      ToastUtils.showSuccess("accountUpdatedSuccessfully".tr());
    });
    updateLoading(false);
  }
}
