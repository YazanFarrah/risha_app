import 'dart:developer';

import 'package:get/get.dart' hide Trans;
import 'package:risha_app/core/utils/toast_utils.dart';
import 'package:risha_app/features/account/data/datasources/account_remote_datasource.dart';
import 'package:risha_app/features/account/data/models/category_model.dart';

class CategoryController extends GetxController {
  final isLoading = false.obs;
  final _accountDatasource = Get.find<AccountRemoteDatasource>();

  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> selectedCategories = <CategoryModel>[].obs;

  @override
  void onInit() async {
    await _fetchInitialData();

    super.onInit();
  }

  Future<void> _fetchInitialData() async {
    log(allCategories.toString());
    log(selectedCategories.toString());
    updateLoading(true);

    final categoriesResult = await _accountDatasource.fetchCategories();
    final userCategoriesResult = await _accountDatasource.fetchUserCategories();

    log(categoriesResult.toString());
    categoriesResult.fold(
      (l) => ToastUtils.showError(l.message),
      (r) => allCategories.value = r,
    );

    userCategoriesResult.fold(
      (l) => ToastUtils.showError(l.message),
      (r) => selectedCategories.value = r,
    );
    log(allCategories.toString());
    log(selectedCategories.toString());

    updateLoading(false);
  }

  void updateLoading(bool val) {
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

  @override
  void onClose() {
    allCategories.clear();
    selectedCategories.clear();
    super.onClose();
  }
}
