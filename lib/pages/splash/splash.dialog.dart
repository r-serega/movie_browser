import 'dart:io';

import 'package:flutter/material.dart';

import '../../services/i10n/glossary.dart';

class NoConnectDialogShowcase extends StatelessWidget {
  const NoConnectDialogShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Glossary.noConnect.tr),
      content: Text(Glossary.noAccess.tr),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              exit(0);
              // Get.back();
            },
            child: Text(Glossary.cancel.tr)),
        // TextButton(onPressed: () {}, child: const Text('ALLOW')),
      ],
    );
  }
}

class NoBackEndDialogShowcase extends StatelessWidget {
  const NoBackEndDialogShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Glossary.noBackend.tr),
      content: Text(Glossary.noAccess.tr),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              exit(0);
              // Get.back();
            },
            child: Text(Glossary.cancel.tr)),
        // TextButton(onPressed: () {}, child: const Text('ALLOW')),
      ],
    );
  }
}

class DialogScreen extends StatelessWidget {
  final Widget dialog;
  const DialogScreen({Key? key, required this.dialog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.01),
      body: dialog,
    );
  }
}
