import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app.dart';

class ThemeService extends GetxController {
  late ThemeMode _themeMode; // = ThemeMode.system;
  final RxBool isDark = false.obs;

  ThemeService() {
    final theme = App.storage.read<int>(StorageFields.sTHEME) ?? 0;
    //ThemeMode.system;
    debugPrint(theme.toString());
    onThemeModeChanged(ThemeMode.values[theme]);
  }

  set themeMode(ThemeMode value) {
    _themeMode = value;
  }

  ThemeMode get themeMode {
    return _themeMode;
  }

  @override
  void onInit() {
    _themeMode = ThemeMode.system;
    super.onInit();
  }

  onThemeModeChanged(ThemeMode mode) {
    themeMode = mode;
    Get.changeThemeMode(themeMode);
    update();
    App.storage.write(StorageFields.sTHEME, mode.index);
  }

  void toggleTheme(bool value) {
    isDark.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    themeMode = value ? ThemeMode.dark : ThemeMode.light;
    App.storage.write(StorageFields.sTHEME, themeMode.index);
    debugPrint(themeMode.index.toString());
  }
}
