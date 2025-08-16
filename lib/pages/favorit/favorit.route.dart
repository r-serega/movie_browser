import 'package:get/get.dart';

import '../../routes.dart';
import 'favorit.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: Routes.favorit,
    page: () {
      return //const
          FavoritScreen();
    },
  ),
];
