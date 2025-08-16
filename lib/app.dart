import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_browser/pages/auth/auth.controller.dart';

import 'config.dart';
import 'pages/favorit/favorit.controller.dart';
import 'services/locale/locale.service.dart';
import 'services/theme/theme.service.dart';

abstract class StorageFields {
  static const sTHEME = "theme";
}

abstract class App {
  static const String packageName = 'moviebrowser';
  static late Config config;
  static late GetStorage storage;
  static late LocaleService localeService;
  static late ThemeService themeService;
  static late AuthController authController;
  static late FavoritController favoritController;

  static Future<void> init(Config config) async {
    App.config = config;
    await GetStorage.init(packageName);
    App.storage = GetStorage(packageName, '/');
    localeService = Get.put(LocaleService(), permanent: true);
    themeService = Get.put(ThemeService());
    authController = Get.put(AuthController());
    favoritController = Get.put(FavoritController());
  }
}
