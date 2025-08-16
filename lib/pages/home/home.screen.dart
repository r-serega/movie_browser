import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes.dart';
import '../../services/theme/theme.service.dart';
import '../auth/auth.controller.dart';
import 'home.controller.dart';
import 'home.drawer.dart';
import '/services/i10n/glossary.dart';

class HomeScreen extends GetView<HomeController> {
  // const
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          Glossary.fulltitle.tr,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
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
      body: GetBuilder<HomeController>(
        init: controller,
        id: 'onItem',
        builder: (controller) {
          return controller.results.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.model.results.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(getPosterUrl(controller.results[index].posterPath, size: 'w92')),
                        title: Text(controller.results[index].title),
                        subtitle: Text(controller.results[index].overview),
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
                                  'isFavorit': false,
                                }),
                                icon: Icon(Icons.find_in_page_sharp, color: Theme.of(context).primaryColor),
                              ),
                              IconButton(
                                // iconSize: 20,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () async {
                                  final authController = Get.find<AuthController>();
                                  if (authController.isAuth.value) {
                                    if (controller.results[index].isFavorit) {
                                      await authController.changeNotFavorite(controller.results[index].id);
                                      controller.selectFavorit();
                                    } else {
                                      await authController.changeFavorite(controller.results[index].id);
                                      controller.selectFavorit();
                                    }
                                    controller.update(['onItem']);
                                  }
                                },
                                icon: Icon(controller.results[index].isFavorit ? Icons.star : Icons.star_border,
                                    color: Theme.of(context).primaryColor),
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
