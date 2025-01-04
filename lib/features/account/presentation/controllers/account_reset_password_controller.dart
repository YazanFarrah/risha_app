import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import 'package:risha_app/core/errors/strings.dart';
import 'package:risha_app/core/network/network_mixin.dart';
import 'package:risha_app/core/utils/toast_utils.dart';
import 'package:risha_app/features/account/data/datasources/account_remote_datasource.dart';

class AccountResetPasswordController extends GetxController with NetworkMixin{
  final RxBool isLoading = false.obs;
  final _accountRemoteDatasource = Get.find<AccountRemoteDatasource>();

  void updateLoading(bool val) {
    isLoading.value = val;
  }

  void updatePassword(String oldPassword, String newPassword) async {
    if (!await isConnected) {
      return ToastUtils.showError(noInternetConnection);
    }
    updateLoading(true);
    final res = await _accountRemoteDatasource.updatePassword(
      oldPassword.trim(),
      newPassword.trim(),
    );
    res.fold((l){
      ToastUtils.showError(l.message);
    }, (r){
      ToastUtils.showSuccess("passwordUpdatedSuccessfully".tr());
    });
    updateLoading(false);
  }
}
