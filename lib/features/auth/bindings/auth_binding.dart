import 'package:risha_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:risha_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:get/get.dart';

class AuthBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut<AuthController>(() => AuthController()),
        Bind.lazyPut<AuthRemoteDatasource>(() => AuthRemoteDatasource()),
      ];
}
