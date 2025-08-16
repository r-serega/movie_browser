import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/services/i10n/glossary.dart';
import '../../routes.dart';
import '../auth/auth.controller.dart';

const containerRadius = Radius.circular(30.0);

class HomeDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  const HomeDrawer({Key? key, required this.drawerKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authController = Get.find<AuthController>();
    return Drawer(
        child: Container(
      color: theme.scaffoldBackgroundColor, 
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(Glossary.fulltitle.tr,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                )),
            accountEmail: Text(Glossary.version.tr,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            currentAccountPicture: CircleAvatar(
              backgroundColor: theme.primaryTextTheme.headline2!.color,
              child: Icon(Icons.video_camera_back_outlined, color: theme.primaryColor, size: 80),
            ),
            decoration: BoxDecoration(
              color: theme.primaryTextTheme.headline2!.color,
              /////////////////
              borderRadius: const BorderRadius.only(bottomRight: containerRadius),
              /////////////////
            ),
          ),
          ListTile(
            title: Text(Glossary.alllist.tr,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
            leading: Icon(CupertinoIcons.list_bullet, color: theme.primaryColor),
            onTap: () async {
              Get.toNamed(Routes.home);
              drawerKey.currentState!.openEndDrawer();
            },
          ),
          authController.isAuth.value
              ? ListTile(
                  title: Text(Glossary.favoritlist.tr,
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )),
                  leading: Icon(Icons.star_half, color: theme.primaryColor),
                  onTap: () async {
                    final authController = Get.find<AuthController>();
                    if (authController.isAuth.value) {
                      Get.toNamed(Routes.favorit);
                    }

                    drawerKey.currentState!.openEndDrawer();
                  },
                )
              : const SizedBox.shrink(),
          ListTile(
            title: Text(Glossary.exit.tr,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
            leading: Icon(Icons.exit_to_app, color: theme.primaryColor),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    ));
  }
}
