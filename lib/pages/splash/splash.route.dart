import 'package:get/get.dart';
import '../../routes.dart';
import '/pages/splash/splash.binding.dart';
import '/pages/splash/splash.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: Routes.splash,
    page: () {
      return const SplashScreen();
    },
    binding: SplashBinding(),
  ),
];