import 'dart:ui';

import 'package:get/get.dart';

import '../i10n/translations.dart';
import '/app.dart';

class LocaleService extends GetxController with Translations {
  LocaleService() {
    final code = App.storage.read<String>('locale') ?? Get.deviceLocale?.languageCode;
    current = createLocale(code != null && dictionaries.containsKey(code) ? code : dictionaries.keys.first);
  }

  final dictionaries = Translation.dictionaries;

  Locale get current => _current;
  set current(Locale locale) {
    _current = locale;
    Get.updateLocale(_current);
    App.storage.write('locale', _current.languageCode);
  }

  Locale createLocale(String code) {
    final lang = code.split('_');
    return Locale(lang[0]);
  }

  @override
  Map<String, Map<String, String>> get keys => dictionaries;

  // Map<int, dynamic> dics = {};

  // @override
  // onInit() {
  //   super.onInit();
  // }

  late Locale _current;

  getLocaleISO() {
    switch (current.languageCode) {
      case "en":
        return 'en-US';
      case 'uk':
        return 'uk-UA';
      case 'ru':
        return 'ru-RU';
      default:
        return 'en-US';
    }
  }
}
