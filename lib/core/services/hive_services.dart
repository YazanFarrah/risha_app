import 'package:get/get.dart';
import 'package:risha_app/config/hive_box_constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveServices {
  final Box _box = Hive.box();

  void setLanguageCode(Locale lang) {
    _box.put(AppSettingsBoxConstants.languageKey, lang.languageCode);
  }

  String get getLanguage {
    return Get.locale?.languageCode ?? "ar";
  }

  // Token management
  void setToken(String? token) {
    if (token != null) {
      _box.put(AppSettingsBoxConstants.tokenKey, token);
    }
  }

  String? get getToken {
    return _box.get(AppSettingsBoxConstants.tokenKey) as String?;
  }

  // Theme management
  void setThemeMode(bool isDarkMode) {
    _box.put(AppSettingsBoxConstants.themeModeKey, isDarkMode);
  }

  bool? getThemeMode() {
    return _box.get(AppSettingsBoxConstants.themeModeKey) as bool?;
  }

  // App rating management

  void setAppRated() {
    _box.put(AppSettingsBoxConstants.isAppRatedKey, true);
  }

  bool? getIsAppRated() {
    return _box.get(AppSettingsBoxConstants.isAppRatedKey) as bool?;
  }

  void setTotalTimeSpent(int seconds) {
    _box.put(AppSettingsBoxConstants.totalTimeSpentKey, seconds);
  }

  int getTotalTimeSpent() {
    return _box.get(AppSettingsBoxConstants.totalTimeSpentKey, defaultValue: 0)
        as int;
  }

  Future<void> clearPreferences() async {
    _box.clear();
  }
}
