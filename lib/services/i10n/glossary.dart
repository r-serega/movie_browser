// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:get/get_utils/src/extensions/internacionalization.dart';

enum Glossary {
  fulltitle,
  detaileddescription,
  releasedate,
  tmdbauth,
  alllist,
  favoritlist,
  version,
  exit,
  noauth,
  noAccess,
  noBackend,
  noConnect,
  cancel,
}

extension GlossaryTranslate on Enum {
  String get tr => name.tr;

  String trAt(int n) {
    final values = tr.split('|');
    return n < values.length ? values[n] : values.last;
  }

  String trParams(Map<String, String> params) {
    var trans = tr;
    params.forEach((key, value) {
      trans = trans.replaceAll('@$key', value);
    });
    return trans;
  }
}
