abstract class DetailsField {
  static const id = 'id';
  static const title = 'title';
  static const overview = 'overview';
  static const posterPath = 'poster_path';
  static const backdropPath = 'backdrop_path';
  static const releaseDate = 'release_date';
  static const voteAverage = 'vote_average';
  static const voteCount = 'vote_count';
  static const genreIds = 'genre_ids';
  static const adult = 'adult';
  static const video = 'video';
  static const originalLanguage = 'original_language';
  static const originalTitle = 'original_title';
  static const popularity = 'popularity';
}

class DetailsModel {
  bool isLoad = false;
  bool isFavorit = false;
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;
  final bool adult;
  final bool video;
  final String originalLanguage;
  final String originalTitle;
  final double popularity;

  DetailsModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
    required this.adult,
    required this.video,
    required this.originalLanguage,
    required this.originalTitle,
    required this.popularity,
  });

  factory DetailsModel.empty() {
    var model = DetailsModel(
      id: 0,
      title: '',
      overview: '',
      posterPath: '',
      backdropPath: '',
      releaseDate: '',
      voteAverage: 0,
      voteCount: 0,
      genreIds: [],
      adult: false,
      video: false,
      originalLanguage: '',
      originalTitle: '',
      popularity: 0,
    );
    model.isLoad = false;
    return model;
  }

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      id: json[DetailsField.id] ?? 0,
      title: json[DetailsField.title] ?? '',
      overview: json[DetailsField.overview] ?? '',
      posterPath: json[DetailsField.posterPath] ?? '',
      backdropPath: json[DetailsField.backdropPath] ?? '',
      releaseDate: json[DetailsField.releaseDate] ?? '',
      voteAverage: (json[DetailsField.voteAverage] as num).toDouble(),
      voteCount: json[DetailsField.voteCount] ?? 0,
      genreIds: List<int>.from(json[DetailsField.genreIds]),
      adult: json[DetailsField.adult] ?? false,
      video: json[DetailsField.video] ?? false,
      originalLanguage: json[DetailsField.originalLanguage] ?? '',
      originalTitle: json[DetailsField.originalTitle] ?? '',
      popularity: (json[DetailsField.popularity] as num).toDouble(),
    );
  }
}
