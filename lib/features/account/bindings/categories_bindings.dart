import 'package:risha_app/features/account/presentation/controllers/category_controller.dart';
import 'package:get/get.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() => [
        Get.lazyPut<CategoryController>(() => CategoryController()),
      ];
}
