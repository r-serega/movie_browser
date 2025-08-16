import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes.dart';
import '../../services/i10n/glossary.dart';
import '../../services/theme/theme.service.dart';
import '../auth/auth.controller.dart';
import '../home/home.drawer.dart';
import 'favorit.controller.dart';

class FavoritScreen extends GetView<FavoritController> {
  // const
  FavoritScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          Glossary.favoritlist.tr,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor

            ///.iconTheme.color,
            ),
        actions: [
          Obx(() => Switch(
                activeColor: Theme.of(context).primaryColorDark,
                activeTrackColor: Theme.of(context).primaryColorLight,
                value: themeService.isDark.value,
                onChanged: themeService.toggleTheme,
              )),
        ],
      ),
      key: drawerKey,
      drawer: HomeDrawer(drawerKey: drawerKey),
      body: GetBuilder<FavoritController>(
        init: controller,
        id: 'onItem',
        builder: (controller) {
          return controller.model.results.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.model.results.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(getPosterUrl(controller.model.results[index].posterPath, size: 'w92')),
                        title: Text(controller.model.results[index].title),
                        subtitle: Text(controller.model.results[index].overview),
                        trailing: SizedBox(
                          width: 48,
                          child: Wrap(
                            direction: Axis.vertical,
                            spacing: 4,
                            children: [
                              IconButton(
                                // iconSize: 20,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () => Get.toNamed(Routes.details, arguments: {
                                  'index': index,
                                  'isFavorit': true,
                                }),
                                icon: Icon(Icons.find_in_page_sharp, color: Theme.of(context).primaryColor),
                              ),
                              IconButton(
                                // iconSize: 20,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () async {
                                  final authController = Get.find<AuthController>();
                                  await authController.changeNotFavorite(controller.model.results[index].id);
                                  controller.getItem();
                                },
                                icon: Icon(Icons.star, color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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
