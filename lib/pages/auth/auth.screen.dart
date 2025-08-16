import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../globals.dart';
import '../../routes.dart';
import '../../services/theme/theme.service.dart';
import '/services/i10n/glossary.dart';
import '/pages/auth/auth.controller.dart';
import '/pages/favorit/favorit.controller.dart';

class AuthScreen extends
// GetView<AuthController> {
    StatelessWidget {
  final String requestToken;

  const AuthScreen({Key? key, required this.requestToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authUrl = 'https://www.themoviedb.org/authenticate/$requestToken';
    final authController = Get.find<AuthController>();
    final themeService = Get.find<ThemeService>();
    final favoritController = Get.find<FavoritController>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          Glossary.tmdbauth.tr,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.check, color: Theme.of(context).primaryColor),
          onPressed: () async {
            await authController.getSession(requestToken);
            if (authController.sessionModel.success == true) {
              await authController.getAccountId();
              await favoritController.getItem2();

              Get.offAllNamed(Routes.home);
            } else {
              final SnackBar snackBar = SnackBar(
                backgroundColor: theme.primaryColor,
                content: Text(
                  Glossary.noauth.tr,
                  style: TextStyle(color: theme.scaffoldBackgroundColor, backgroundColor: theme.primaryColor),
                ),
              );

              snackbarKey.currentState?.showSnackBar(snackBar);

              Get.offAllNamed(Routes.home);
            }
          },
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
      body: WebView(
        initialUrl: authUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
