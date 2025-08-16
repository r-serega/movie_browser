import 'package:get/get.dart';
import 'package:movie_browser/pages/details/details.controller.dart';

import '../../routes.dart';
import '../favorit/favorit.controller.dart';
import '../home/home.controller.dart';
import 'details.binding.dart';
import 'details.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: Routes.details, // '/',
    page: () {
      final arguments = Get.arguments;

      if (arguments != null && arguments is Map) {
        final value = arguments['index'];
        final detailsController = Get.find<DetailsController>();
        final isFavorit = arguments['isFavorit'];
        if (isFavorit) {
          final favoritController = Get.find<FavoritController>();
          detailsController.setModel(favoritController.model.results[value], isFavorit);
        } else {
          final homeController = Get.find<HomeController>();
          detailsController.setModel(homeController.results[value], isFavorit);
        }
      }
      return const DetailsScreen();
    },
    binding: DetailsBinding(),
  ),
];
