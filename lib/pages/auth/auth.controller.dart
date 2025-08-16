import 'package:get/get.dart';

import '../../models/account.model.dart';
import '../../models/requesttoken.model.dart';
import '../../models/session.model.dart';
import '../../providers/account.provider.dart';
import '../../providers/requesttoken.provider.dart';
import '../favorit/favorit.controller.dart';

class AuthController extends GetxController {
  late SessionModel sessionModel = SessionModel.empty();
  late AccountModel accountModel;
  final RxBool isAuth = false.obs;
  
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // Future<SessionModel>
  getSession(String requestToken) async {
    sessionModel = await RequestTokenProvider().getSession(requestToken);
  }

  getAccountId() async {
    accountModel = await AccountProvider().getAccountId(sessionModel.sessionId);
    isAuth.value = true;
  }

  changeFavorite(int movieId) async {
    await AccountProvider().changeFavorit(accountModel.id.toString(), sessionModel.sessionId, movieId);
    final favoritController = Get.find<FavoritController>();
    await favoritController.getItem2();
  }

  changeNotFavorite(int movieId) async {
    await AccountProvider().changeNotFavorit(accountModel.id.toString(), sessionModel.sessionId, movieId);
    final favoritController = Get.find<FavoritController>();
    await favoritController.getItem2();
  }

  Future<bool> checkAccess() async {
    final RequestTokenModel model = await RequestTokenProvider().getAuth();
    return model.success;
  }

  Future<RequestTokenModel> getAccount() async {
    return await RequestTokenProvider().getAuth();
  }
}
