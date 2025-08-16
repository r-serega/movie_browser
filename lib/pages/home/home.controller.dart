import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/locale/locale.service.dart';
import '../auth/auth.controller.dart';
import '../details/details.model.dart';
import '../favorit/favorit.controller.dart';
import './home.model.dart';
import './home.provider.dart';

class HomeController extends GetxController {
  late HomeModel model = HomeModel.empty();
  final List<DetailsModel> results = [];
  final RxInt currentPage = 1.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getItem(currentPage.value);
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
      nextPage();
    }
  }

  void getItem(int current) async {
    final localeService = Get.find<LocaleService>();
    model = await HomeProvider().getItem(current, localeService.getLocaleISO());
    results.addAll(model.results);

    selectFavorit();
    update(['onItem']);
  }

  void nextPage() async {
    currentPage.value++;
    getItem(currentPage.value);
  }

  selectFavorit() {
    final authController = Get.find<AuthController>();
    if (authController.isAuth.value) {
      final favoritController = Get.find<FavoritController>();
      for (var home in results) {
        home.isFavorit = false;
        for (var favor in favoritController.model.results) {
          if (home.id == favor.id) {
            home.isFavorit = true;
          }
        }
      }
    }
  }
}
