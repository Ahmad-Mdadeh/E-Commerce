import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final key = "isDarkModes";

  void saveThemeDataInBox(bool isDark) {
    boxStorage.write(key, isDark);
  }

  bool getThemeDataFromInBox() {
    return boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get themeDataGet {
    return getThemeDataFromInBox() ? ThemeMode.dark : ThemeMode.light;
  }

  void chengTheme() {
    Get.changeThemeMode(
      getThemeDataFromInBox() ? ThemeMode.light : ThemeMode.dark,
    );
    saveThemeDataInBox(!getThemeDataFromInBox());
  }
}
