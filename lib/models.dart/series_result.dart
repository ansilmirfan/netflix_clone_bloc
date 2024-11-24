import 'dart:convert';

class Result {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double? popularity;
  String? posterPath;
  DateTime? firstAirDate;
  String name;
  double? voteAverage;
  int voteCount;

  Result({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    required this.name,
    this.voteAverage,
    required this.voteCount,
  });

  Result copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? firstAirDate,
    String? name,
    double? voteAverage,
    int? voteCount,
  }) =>
      Result(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        originCountry: originCountry ?? this.originCountry,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalName: originalName ?? this.originalName,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        firstAirDate: firstAirDate ?? this.firstAirDate,
        name: name ?? this.name,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static DateTime? parseDate(String? dateStr) {
    if (dateStr == null) return null;
    try {
      return DateTime.parse(dateStr);
    } catch (e) {
      return null;
    }
  }

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"] ?? '',
        originalName: json["original_name"] ?? '',
        overview: json["overview"] ?? '',
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: parseDate(json["first_air_date"]),
        name: json["name"] ?? '',
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "first_air_date": firstAirDate != null
            ? "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}"
            : null,
        "name": name,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
