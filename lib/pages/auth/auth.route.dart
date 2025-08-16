import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../routes.dart';
import 'auth.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: Routes.auth,
    page: () {
      final arguments = Get.arguments;

      if (arguments != null && arguments is Map) {
        final value = arguments['requestToken'];
        return AuthScreen(requestToken: value);
      } else {
        return const SizedBox.shrink();
      }
    },
    // binding: AuthBinding(),
  ),
];
