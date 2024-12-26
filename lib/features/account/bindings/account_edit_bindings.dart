import 'package:get/get.dart';
import 'package:risha_app/features/account/presentation/controllers/edit_account_controller.dart';

class AccountEditBindings extends Bindings {
  @override
  void dependencies() => [
        Get.lazyPut<EditAccountController>(() => EditAccountController()),
      ];
}
