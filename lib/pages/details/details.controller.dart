import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/auth.controller.dart';
import '../favorit/favorit.controller.dart';
import 'details.model.dart';

class DetailsController extends GetxController {
  late DetailsModel model = DetailsModel.empty();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      debugPrint("Reached end of scroll");
    }
  }

  void setModel(DetailsModel value, bool favorit) async {
    model.isFavorit = favorit;
    model = DetailsModel(
        id: value.id,
        title: value.title,
        overview: value.overview,
        posterPath: value.posterPath,
        backdropPath: value.backdropPath,
        releaseDate: value.releaseDate,
        voteAverage: value.voteAverage,
        voteCount: value.voteCount,
        genreIds: value.genreIds,
        adult: value.adult,
        video: value.video,
        originalLanguage: value.originalLanguage,
        originalTitle: value.originalTitle,
        popularity: value.popularity);
    model.isLoad = true;

    model.isFavorit = await checkInFavorit(favorit, value.id);
    update(['onItem']);
  }

  Future<bool> checkInFavorit(bool favorit, int idMovie) async {
    final authController = Get.find<AuthController>();
    if (authController.isAuth.value) {
      final favoritController = FavoritController();
      await favoritController.getItem2();
      for (var item in favoritController.model.results) {
        if (item.id == idMovie) {
          return true;
        }
      }
      return false;
    } else {
      return favorit;
    }
  }
}
