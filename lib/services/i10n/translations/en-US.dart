// ignore_for_file: non_constant_identifier_names, file_names
import '../glossary.dart';

final Map<String, String> en_US = <Glossary, String>{
  Glossary.fulltitle: "Movie Browser",
  Glossary.detaileddescription: "Detailed Description",
  Glossary.releasedate: "Release Date",
  Glossary.tmdbauth: "TMDB Authorization",
  Glossary.alllist: "Movie List",
  Glossary.favoritlist: "Favorite Movies",
  Glossary.version: "version 0.0.1",
  Glossary.exit: "Exit",
  Glossary.noauth: "Authorization not confirmed, favorites section is not available.",
  Glossary.noAccess: "NO ACCESS TO THE INTERNET. MAKE THE CONNECTION AND TRY AGAIN.",
  Glossary.noBackend: "NO ACCESS TO CLOUD SERVICE. TRY LATER.",
  Glossary.noConnect: "NO CONNECT",
  Glossary.cancel: "Cancel",
}.map((n, v) => MapEntry(n.name, v));
