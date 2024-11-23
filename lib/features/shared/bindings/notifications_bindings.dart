import 'package:get/get.dart';
import 'package:risha_app/features/shared/presentation/controllers/notifications_controller.dart';

class NotificationsBindings extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut<NotificationsController>(() => NotificationsController()),
      ];
}
