import 'dart:developer';

import 'package:get/get.dart';
import 'package:risha_app/core/utils/toast_utils.dart';
import 'package:risha_app/features/home/data/datasources/home_remote_datasource.dart';

class RefreshHomeDataController extends GetxController {
  final _homeRemoteDatasource = Get.find<HomeRemoteDatasource>();

  Future<void> refreshHomeData() async {
    try {
      final results = await _homeRemoteDatasource.refreshAllData();

      // Collect all failures
      final failures = results.where((result) => result.isLeft()).toList();

      // If all calls failed, show one specific error (e.g., the first failure)
      if (failures.isNotEmpty) {
        final firstFailure = failures.first.getLeft();
        firstFailure.fold(
          () {
            ToastUtils.showError("Error");
          },
          (_) {},
        );
        return;
      }

      // Handle successful results
      for (final result in results) {
        result.fold(
          (_) {}, // Ignore failures here since they're already handled above
          (data) {
            // Process success data
            log("Success: $data");
          },
        );
      }
    } catch (e) {
      // Handle any unexpected exceptions
      ToastUtils.showError("An unexpected error occurred.");
      log("Error while refreshing home data: $e");
    }
  }
}
