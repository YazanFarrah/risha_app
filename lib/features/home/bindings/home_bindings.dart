import 'package:get/get.dart';
import 'package:risha_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:risha_app/features/home/presentation/controllers/refresh_home_data_controller.dart';
import 'package:risha_app/features/home/presentation/controllers/trendy_quizzes_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRemoteDatasource>(() => HomeRemoteDatasource());
    Get.lazyPut<RefreshHomeDataController>(() => RefreshHomeDataController());
    Get.lazyPut<TrendyQuizzesController>(() => TrendyQuizzesController());
  }
}
