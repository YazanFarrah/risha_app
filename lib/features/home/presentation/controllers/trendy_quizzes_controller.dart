import 'package:get/get.dart';
import 'package:risha_app/core/utils/toast_utils.dart';
import 'package:risha_app/features/home/data/models/trendy_quizzes_model.dart';

import '../../data/datasources/home_remote_datasource.dart';

class TrendyQuizzesController extends GetxController {
  final RxList<TrendyQuizzesModel> trendyQuizzes = <TrendyQuizzesModel>[].obs;
  final _homeRemoteDatasource = Get.find<HomeRemoteDatasource>();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTrendyQuizzes();
  }

  void fetchTrendyQuizzes() async {
    isLoading(true);
    final res = await _homeRemoteDatasource.fetchTrendyQuizzes();
    res.fold(
      (l) => ToastUtils.showError(l.message),
      (r) => trendyQuizzes(r),
    );
    isLoading(false);
  }
}
