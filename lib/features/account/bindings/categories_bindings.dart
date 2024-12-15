import 'package:risha_app/features/account/data/datasources/account_remote_datasource.dart';
import 'package:risha_app/features/account/presentation/controllers/category_controller.dart';
import 'package:get/get.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() => [
        Get.lazyPut<CategoryController>(() => CategoryController()),
        Get.lazyPut<AccountRemoteDatasource>(() => AccountRemoteDatasource()),
      ];
}
