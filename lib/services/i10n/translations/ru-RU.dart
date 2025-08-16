// ignore_for_file: non_constant_identifier_names, file_names
import '../glossary.dart';

final Map<String, String> ru_RU = <Glossary, String>{
  Glossary.fulltitle: "Браузер фильмов",
  Glossary.detaileddescription: "Детальное Описание",
  Glossary.releasedate: "Дата выпуска",
  Glossary.tmdbauth: "Авторизация TMDB",
  Glossary.alllist: "Cписок фильмов",
  Glossary.favoritlist: "Любимые фильмы",
  Glossary.version: "версия 0.0.1",
  Glossary.exit: "Выход",
  Glossary.noauth: "Авторизация не подтверждена, раздел избранного недоступен.",
  Glossary.noAccess: "НЕТ ДОСТУПА К ІНТЕРНЕТУ. УСТАНОВИТЕ ПОДКЛЮЧЕНИЕ И ПОПРОБУЙТЕ СНОВА.",
  Glossary.noBackend: "НЕТ ДОСТУПА К ОБЛАЧНОМУ СЕРВИСУ. ПОПРОБУЙТЕ СНОВА",
  Glossary.noConnect: "НЕТ ПОДКЛЮЧЕНИЯ",
  Glossary.cancel: "Отменить",
}.map((n, v) => MapEntry(n.name, v));
