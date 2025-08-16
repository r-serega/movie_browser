import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../globals.dart';
import '../../routes.dart';
import '../auth/auth.controller.dart';
import 'splash.dialog.dart';

class SplashController extends GetxController {
  final RxBool _isInet = false.obs;
  bool get isInet {
    return _isInet.value;
  }

  set isInet(bool value) {
    _isInet.value = value;
  }

  final RxBool _isBackend = false.obs;
  bool get isBackend {
    return _isBackend.value;
  }

  set isBackend(bool value) {
    _isBackend.value = value;
  }

  final RxBool _isUser = false.obs;
  bool get isUser {
    return _isUser.value;
  }

  set isUser(bool value) {
    _isUser.value = value;
  }

  @override
  void onInit() async {
    super.onInit();
    Timer(
      const Duration(seconds: 1),
      () async {
        isInet = await _isInternet();
        if (isInet) {
          Timer(const Duration(seconds: 1), () async {
            final authController = Get.find<AuthController>();
            final requestTokenModel = await authController.getAccount();
            isBackend = requestTokenModel.success;
            if (isBackend) {
              isUser = authController.isAuth.value;

              Get.offAllNamed(Routes.auth, arguments: {
                'requestToken': requestTokenModel.requestToken,
              });
            } else {
              navigatorKey.currentState!.push<void>(PageRouteBuilder(
                pageBuilder: (_, __, ___) => const DialogScreen(dialog: NoBackEndDialogShowcase()),
                opaque: false,
                fullscreenDialog: true,
              ));
            }
          });
        } else {
          navigatorKey.currentState!.push<void>(PageRouteBuilder(
            pageBuilder: (_, __, ___) => const DialogScreen(dialog: NoConnectDialogShowcase()),
            opaque: false,
            fullscreenDialog: true,
          ));
        }
      },
    );
  }

  Future<bool> _isInternet() async {
    if (GetPlatform.isWeb) {
      return true;
    } else {
      if (GetPlatform.isAndroid) {
        bool result = await InternetConnectionChecker().hasConnection;
        if (result == true) {
          debugPrint('YAY! Free cute dog pics!');
        } else {
          debugPrint('No internet :( Reason:');
         }
        return result;
      } else {
        //Desktop
        return true;
      }
    }
  }
}
