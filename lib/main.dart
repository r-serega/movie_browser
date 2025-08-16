import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'config.dart';
import 'globals.dart';
import 'routes.dart';
import 'services/i10n/glossary.dart';
import 'services/locale/locale.service.dart';
import 'services/theme/theme.service.dart';
import 'services/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await initServices();
  runApp(const MyApp());
}

Future initServices() async {
  await App.init(Config());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeService = Get.find<LocaleService>();
    final themeService = Get.find<ThemeService>();

    return GetMaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: snackbarKey,
      debugShowCheckedModeBanner: false,
      title: Glossary.fulltitle.tr,
      initialRoute: Routes.splash, // .home,
      translations: localeService,
      locale: localeService.current,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: themeService.themeMode,

      getPages: getRoutes(),
    );
  }
}
