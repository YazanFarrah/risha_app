import 'package:risha_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:risha_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:get/get.dart';
import 'package:risha_app/features/auth/presentation/controllers/reset_password_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() => [
        Get.lazyPut<AuthController>(() => AuthController()),
        Get.lazyPut<ResetPasswordController>(() => ResetPasswordController()),
        Get.lazyPut<AuthRemoteDatasource>(() => AuthRemoteDatasource()),
      ];
}
