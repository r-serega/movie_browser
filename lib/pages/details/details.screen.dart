import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/i10n/glossary.dart';
import '../../services/theme/theme.service.dart';
import '../auth/auth.controller.dart';
import '../home/home.controller.dart';
import 'details.controller.dart';
import '/pages/favorit/favorit.controller.dart';

class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          Glossary.detaileddescription.tr,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: Theme.of(context).primaryColor),
          onPressed: () async {
            final homeController = Get.find<HomeController>();
            final favoritController = Get.find<FavoritController>();
            await favoritController.getItem2();
            homeController.selectFavorit();
            homeController.update(['onItem']);
            Get.back();
          },
        ),
        actions: [
          IconButton(
              onPressed: () async {
                final authController = Get.find<AuthController>();
                if (authController.isAuth.value) {
                  await authController.changeNotFavorite(controller.model.id);
                }
                if (authController.isAuth.value) {
                  if (controller.model.isFavorit) {
                    await authController.changeNotFavorite(controller.model.id);
                    controller.model.isFavorit = false;
                  } else {
                    await authController.changeFavorite(controller.model.id);
                    controller.model.isFavorit = true;
                  }
                  controller.update(['onItem']);
                }
              },
              icon: Icon(Icons.star_half, color: Theme.of(context).primaryColor)),
          Obx(() => Switch(
                activeColor: Theme.of(context).primaryColorDark,
                activeTrackColor: Theme.of(context).primaryColorLight,
                value: themeService.isDark.value,
                onChanged: themeService.toggleTheme,
              )),
        ],
      ),
      body: GetBuilder<DetailsController>(
        init: controller,
        id: 'onItem',
        builder: (controller) {
          return !controller.model.isLoad
              ? const Center(child: CircularProgressIndicator())
              : Card(
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 0),
                        ListTile(
                          leading: Icon(controller.model.isFavorit ? Icons.star : Icons.star_border),
                          title: Text(
                            controller.model.title,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 00),
                        Image.network(getPosterUrl(controller.model.posterPath, size: 'w342')),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0, bottom: 0.0),
                          child: Text(controller.model.overview),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          Glossary.releasedate.tr,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.model.releaseDate,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  String getPosterUrl(String? posterPath, {String size = 'w500'}) {
    if (posterPath == null) return '';
    return 'https://image.tmdb.org/t/p/$size$posterPath';
  }
}
