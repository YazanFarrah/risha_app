import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import 'package:risha_app/core/errors/strings.dart';
import 'package:risha_app/core/network/network_mixin.dart';
import 'package:risha_app/core/utils/toast_utils.dart';
import 'package:risha_app/features/account/data/datasources/account_remote_datasource.dart';
import 'package:risha_app/features/account/data/models/countries_model.dart';
import 'package:risha_app/config/countries_list.dart';
import 'package:risha_app/features/auth/data/models/user_model.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class EditAccountController extends GetxController with NetworkMixin {
  final RxBool isLoading = false.obs;
  final tempAvatarPath = Rxn<String>();
  final selectedCountry = Country().obs;
  final _accountRemoteDatasource = Get.find<AccountRemoteDatasource>();
  final _currentUserController = Get.find<CurrentUserController>();

  @override
  void onInit() {
    if (_currentUserController.user.value?.country != null) {
      selectedCountry.value = countriesList.firstWhere(
          (c) => c.iso2 == _currentUserController.user.value?.country!.iso2);
    }
    super.onInit();
  }

  void updateLoading(bool val) {
    isLoading.value = val;
  }

  void updateTempAvatarPath(String? path) {
    tempAvatarPath.value = path;
  }

  void updateUser(UserModel user) async {
    if (!await isConnected) {
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

  void updateTempCountry(String iso2) {
    final country = countriesList.firstWhere((c) => c.iso2 == iso2);
    selectedCountry.value = country;
  }
}
