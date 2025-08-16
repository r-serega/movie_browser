// ignore_for_file: non_constant_identifier_names, file_names
import '../glossary.dart';

final Map<String, String> uk_UA = <Glossary, String>{
  Glossary.fulltitle: "Оглядач фільмів",
  Glossary.detaileddescription: "Детальний Опис",
  Glossary.releasedate: "Дата випуску",
  Glossary.tmdbauth: "Авторизація TMDB",
  Glossary.alllist: "Список фільмів",
  Glossary.favoritlist: "Улюблені фільми",
  Glossary.version: "версія 0.0.1",
  Glossary.exit: "Вихід",
  Glossary.noauth: "Авторизація не підтверджена, розділ обраного недоступний.",
  Glossary.noAccess: "НЕМАЄ ДОСТУПУ ДО ІНТЕРНЕТУ. ВСТАНОВІТЬ ПІДКЛЮЧЕННЯ ТА СПРОБУЙТЕ ЩЕ НОВО.",
  Glossary.noBackend: "НЕМАЄ ДОСТУПУ ДО ХМАРНОГО СХОВИЩА БАЗИ ДАНИХ. СПРОБУЙТЕ ПІЗНІШЕ.",
  Glossary.noConnect: "НЕМАЄ ПІДКЛЮЧЕННЯ",
  Glossary.cancel: "Відмінити",
}.map((n, v) => MapEntry(n.name, v));
