import 'package:get/get.dart';

class AccountResetPasswordController extends GetxController {
  final RxBool isLoading = false.obs;

  void updateLoading(bool val) {
    isLoading.value = val;
  }

  
}
