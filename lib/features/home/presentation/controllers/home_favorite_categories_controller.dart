import 'package:get/get.dart';
import 'package:risha_app/core/utils/toast_utils.dart';
import 'package:risha_app/features/account/data/models/category_model.dart';
import 'package:risha_app/features/home/data/datasources/home_remote_datasource.dart';

class HomeFavoriteCategoriesController extends GetxController {
  List<CategoryModel> favoriteCategories = [];
  final _homeRemoteDatasource = Get.find<HomeRemoteDatasource>();

  void updateFavoriteCategories(List<CategoryModel> categories) {
    favoriteCategories.assignAll(categories);
    update();
  }

  void fetchFavoriteCategories() async {
    final res = await _homeRemoteDatasource.fetchUserFavoriteCategories();
    res.fold((l) {
      ToastUtils.showError(l.message);
    }, (r) {
      updateFavoriteCategories(r);
    });
  }
}
