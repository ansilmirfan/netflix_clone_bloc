import 'dart:convert';

import 'package:netflix_clone_bloc/models.dart/series_result.dart';

class SearchSeries {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  SearchSeries({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  SearchSeries copyWith({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      SearchSeries(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory SearchSeries.fromRawJson(String str) =>
      SearchSeries.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchSeries.fromJson(Map<String, dynamic> json) => SearchSeries(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

