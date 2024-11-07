import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class ToastUtils {
  // Show error snackbar
  static void showError(String error) {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();
    Get.rawSnackbar(
      message: error,
      backgroundColor: Colors.red.withOpacity(0.8),
      snackPosition: SnackPosition.bottom,
      margin: EdgeInsets.all(10),
      borderRadius: 8,
      duration: Duration(seconds: 3),
      isDismissible: true,
    );
  }

  // Show success snackbar
  static void showSuccess(String message) {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();
    Get.rawSnackbar(
      message: message,
      backgroundColor: Colors.green.withOpacity(0.8),
      snackPosition: SnackPosition.bottom,
      margin: EdgeInsets.all(10),
      borderRadius: 8,
      duration: Duration(seconds: 3),
      isDismissible: true,
    );
  }
}
