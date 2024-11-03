import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastUtils {
  // Show error snackbar
  static void showError(String error) {
    Get.snackbar(
      "Error", // Title
      error, // Message
      backgroundColor: Colors.red.withOpacity(0.8),
      colorText: Colors.white, // Text color
      snackPosition: SnackPosition.bottom, // Position of the snackbar
      margin: EdgeInsets.all(10),
      borderRadius: 8,
      duration: Duration(seconds: 3), // Display duration
      isDismissible: true,
    );
  }

  // Show success snackbar
  static void showSuccess(String message) {
    Get.snackbar(
      "Success", // Title
      message, // Message
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
      snackPosition: SnackPosition.bottom,
      margin: EdgeInsets.all(10),
      borderRadius: 8,
      duration: Duration(seconds: 3),
      isDismissible: true,
    );
  }
}
