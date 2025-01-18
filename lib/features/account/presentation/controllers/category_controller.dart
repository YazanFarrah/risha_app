import 'dart:developer';

import 'package:get/get.dart' hide Trans;
import 'package:risha_app/core/utils/extensions.dart';
import 'package:risha_app/core/utils/toast_utils.dart';
import 'package:risha_app/features/account/data/datasources/account_remote_datasource.dart';
import 'package:risha_app/features/account/data/models/category_model.dart';
import 'package:risha_app/features/home/presentation/controllers/home_favorite_categories_controller.dart';

class CategoryController extends GetxController {
  final _accountDatasource = Get.find<AccountRemoteDatasource>();
  final _homeFavoriteCategoriesController =
      Get.find<HomeFavoriteCategoriesController>();

  final isLoading = false.obs;
  final isUpdatingCategories = false.obs;
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> selectedCategories = <CategoryModel>[].obs;

  @override
  void onInit() async {
    await _fetchInitialData();
    super.onInit();
  }

  Future<void> _fetchInitialData() async {
    log(allCategories.toString());
    _updateLoading(true);

    final categoriesResult = await _accountDatasource.fetchUserCategories();
    // final userCategoriesResult = await _accountDatasource.fetchUserCategories();

    log(categoriesResult.toString());
    categoriesResult.fold(
      (l) => ToastUtils.showError(l.message),
      (r) {
        allCategories.assignAll(r);
        selectedCategories.assignAll(
          r.where((category) => category.isFavorite == true),
        );
      },
    );

    // userCategoriesResult.fold(
    //   (l) => ToastUtils.showError(l.message),
    //   (r) => selectedCategories.value = r,
    // );
    log(allCategories.toString());

    _updateLoading(false);
  }

  void _updateLoading(bool val) {
    isLoading.value = val;
  }

  void toggleCategorySelection(CategoryModel category) {
    final index = selectedCategories.indexWhere((c) => c.id == category.id);
    if (index != -1) {
      selectedCategories.removeAt(index);
    } else {
      selectedCategories.add(category);
    }
  }

  void updateFavoriteCategories() async {
    isUpdatingCategories(true);
    final res = await _accountDatasource.updateFavoriteCategories(
      selectedCategories.map((category) => category.id.toString()).toList(),
    );

    res.fold((l) {
      ToastUtils.showError(l.message);
    }, (r) {
      _homeFavoriteCategoriesController
          .updateFavoriteCategories(selectedCategories);
      Get.back();
      ToastUtils.showSuccess("updatedCategoriesSuccessfully");
    });
    isUpdatingCategories(false);
  }

  @override
  void onClose() {
    allCategories.clearClose();
    selectedCategories.clearClose();
    isLoading.close();
    isUpdatingCategories.close();
    super.onClose();
  }
}
