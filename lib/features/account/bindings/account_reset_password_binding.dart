import 'package:risha_app/features/account/presentation/controllers/account_reset_password_controller.dart';
import 'package:get/get.dart';

class AccountResetPasswordBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut<AccountResetPasswordController>(
            () => AccountResetPasswordController()),
      ];
}
