import 'translations/en-US.dart';
import 'translations/uk-UA.dart';
import 'translations/ru-RU.dart';

abstract class Translation {
  static Map<String, Map<String, String>> dictionaries = {
    'en': en_US,
    'uk': uk_UA,
    'ru': ru_RU,
  };
}
