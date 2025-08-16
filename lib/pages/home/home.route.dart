import 'package:get/get.dart';
import '../../routes.dart';
import './home.binding.dart';
import './home.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: Routes.home,// '/',
    page: () {
      return //const 
      HomeScreen();
    },
    binding: HomeBinding(),
  ),
];