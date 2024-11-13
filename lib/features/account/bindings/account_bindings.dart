import 'package:risha_app/features/account/presentation/controllers/settings_controller.dart';
import 'package:get/get.dart';

class AccountBindings extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut<SettingsController>(() => SettingsController()),
      ];
}
