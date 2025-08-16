import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'spalsh.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.video_camera_back_outlined, color: theme.primaryColor, size: 128),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Icon(CupertinoIcons.bolt_circle,
                    size: 80, color: controller.isInet ? Colors.greenAccent : Colors.redAccent)),
                Obx(() => Icon(Icons.cloud_circle_outlined,
                    size: 80, color: controller.isBackend ? Colors.greenAccent : Colors.redAccent)),
                Obx(() => Icon(CupertinoIcons.person_circle,
                    size: 80, color: controller.isUser ? Colors.greenAccent : Colors.redAccent)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
