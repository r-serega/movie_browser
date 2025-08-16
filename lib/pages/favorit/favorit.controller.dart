import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../providers/account.provider.dart';
import '../../services/locale/locale.service.dart';
import '../auth/auth.controller.dart';
import '../home/home.model.dart';
import '../../models/requesttoken.model.dart';
import '/providers/requesttoken.provider.dart';

class FavoritController extends GetxController {
  late HomeModel model = HomeModel.empty();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    // getItem();
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

  void getItem() async {
    final localeService = Get.find<LocaleService>();
    final authController = Get.find<AuthController>();
    model = await AccountProvider().getFavoriteItem(
        authController.accountModel.id.toString(), authController.sessionModel.sessionId, localeService.getLocaleISO());
    update(['onItem']);
  }

  Future<HomeModel> getItem2() async {
    final localeService = Get.find<LocaleService>();
    final authController = Get.find<AuthController>();
    model = await AccountProvider().getFavoriteItem(
        authController.accountModel.id.toString(), authController.sessionModel.sessionId, localeService.getLocaleISO());
    return model;
  }

  Future<RequestTokenModel> getAccount() async {
    return await RequestTokenProvider().getAuth();
  }
}
