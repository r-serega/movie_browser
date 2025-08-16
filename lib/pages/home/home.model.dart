import 'dart:core';

import '../details/details.model.dart';

abstract class HomeFields {
  static const page = 'page';
  static const results = 'results';
  static const totalPages = 'total_pages';
  static const totalResults = 'total_results';
}

class HomeModel {
  bool isLoad = false;
  int page;
  final List<DetailsModel> results;
  int totalPages;
  int totalResults;

  HomeModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory HomeModel.empty() {
    var model = HomeModel(page: 0, results: [], totalPages: 0, totalResults: 0);
    model.isLoad = false;
    return model;
  }

  factory HomeModel.fromJson(dynamic json) {
    var model = HomeModel(
      page: json[HomeFields.page] ?? 0,
      results: (json[HomeFields.results] as List).map((movieJson) => DetailsModel.fromJson(movieJson)).toList(),
      totalPages: json[HomeFields.totalPages] ?? 0,
      totalResults: json[HomeFields.totalResults] ?? 0,
    );
    model.isLoad = true;
    return model;
  }
}
