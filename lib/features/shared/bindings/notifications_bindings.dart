import 'package:get/get.dart';
import 'package:risha_app/features/shared/presentation/controllers/notifications_controller.dart';

class NotificationsBindings extends Bindings {
  @override
  void dependencies() => [
        Get.lazyPut<NotificationsController>(() => NotificationsController()),
      ];
}
