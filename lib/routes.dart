import 'package:get/get.dart';
import './pages/home/home.route.dart' as home;
import './pages/favorit/favorit.route.dart' as favorit;
import './pages/details/details.route.dart' as details;
import './pages/auth/auth.route.dart' as auth;
import './pages/splash/splash.route.dart' as splash;

class Routes {
  static const String home = "/";
  static const String favorit = "/favorit";
  static const String details = "/details";
  static const String auth = "/auth";
  static const String splash = "/splash";
}

final List<GetPage> _routes = List<GetPage>.empty(growable: true)
  ..addAll(home.routes)
  ..addAll(favorit.routes)
  ..addAll(details.routes)
  ..addAll(auth.routes)
  ..addAll(splash.routes);

List<GetPage> getRoutes() {
  return _routes;
}
