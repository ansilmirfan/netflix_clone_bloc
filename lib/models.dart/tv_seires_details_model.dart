import 'dart:convert';

class TvSeriesDetailsModel {
  bool adult;
  dynamic backdropPath;
  List<dynamic> createdBy;
  List<int> episodeRunTime;
  DateTime firstAirDate;
  List<Genre> genres;
  String homepage;
  int id;
  bool inProduction;
  List<String> languages;
  DateTime lastAirDate;
  LastEpisodeToAir lastEpisodeToAir;
  String name;
  dynamic nextEpisodeToAir;
  List<Network> networks;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  List<dynamic> productionCompanies;
  List<dynamic> productionCountries;
  List<Season> seasons;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String type;
  double voteAverage;
  int voteCount;

  TvSeriesDetailsModel({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  TvSeriesDetailsModel copyWith({
    bool? adult,
    dynamic backdropPath,
    List<dynamic>? createdBy,
    List<int>? episodeRunTime,
    DateTime? firstAirDate,
    List<Genre>? genres,
    String? homepage,
    int? id,
    bool? inProduction,
    List<String>? languages,
    DateTime? lastAirDate,
    LastEpisodeToAir? lastEpisodeToAir,
    String? name,
    dynamic nextEpisodeToAir,
    List<Network>? networks,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    List<dynamic>? productionCompanies,
    List<dynamic>? productionCountries,
    List<Season>? seasons,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? type,
    double? voteAverage,
    int? voteCount,
  }) =>
      TvSeriesDetailsModel(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        createdBy: createdBy ?? this.createdBy,
        episodeRunTime: episodeRunTime ?? this.episodeRunTime,
        firstAirDate: firstAirDate ?? this.firstAirDate,
        genres: genres ?? this.genres,
        homepage: homepage ?? this.homepage,
        id: id ?? this.id,
        inProduction: inProduction ?? this.inProduction,
        languages: languages ?? this.languages,
        lastAirDate: lastAirDate ?? this.lastAirDate,
        lastEpisodeToAir: lastEpisodeToAir ?? this.lastEpisodeToAir,
        name: name ?? this.name,
        nextEpisodeToAir: nextEpisodeToAir ?? this.nextEpisodeToAir,
        networks: networks ?? this.networks,
        numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
        numberOfSeasons: numberOfSeasons ?? this.numberOfSeasons,
        originCountry: originCountry ?? this.originCountry,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalName: originalName ?? this.originalName,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        productionCompanies: productionCompanies ?? this.productionCompanies,
        productionCountries: productionCountries ?? this.productionCountries,
        seasons: seasons ?? this.seasons,
        spokenLanguages: spokenLanguages ?? this.spokenLanguages,
        status: status ?? this.status,
        tagline: tagline ?? this.tagline,
        type: type ?? this.type,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory TvSeriesDetailsModel.fromRawJson(String str) =>
      TvSeriesDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TvSeriesDetailsModel.fromJson(Map<String, dynamic> json) =>
      TvSeriesDetailsModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        createdBy: List<dynamic>.from(json["created_by"].map((x) => x)),
        episodeRunTime: List<int>.from(json["episode_run_time"].map((x) => x)),
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        lastAirDate: DateTime.parse(json["last_air_date"]),
        lastEpisodeToAir:
            LastEpisodeToAir.fromJson(json["last_episode_to_air"]),
        name: json["name"],
        nextEpisodeToAir: json["next_episode_to_air"],
        networks: List<Network>.from(
            json["networks"].map((x) => Network.fromJson(x))),
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: (json["popularity"] as num?)?.toDouble() ?? 0.0,
        posterPath: json["poster_path"],
        productionCompanies:
            List<dynamic>.from(json["production_companies"].map((x) => x)),
        productionCountries:
            List<dynamic>.from(json["production_countries"].map((x) => x)),
        seasons:
            List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
        spokenLanguages: List<SpokenLanguage>.from(
            json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: (json["vote_average"] as num?)?.toDouble() ?? 0.0,
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "created_by": List<dynamic>.from(createdBy.map((x) => x)),
        "episode_run_time": List<dynamic>.from(episodeRunTime.map((x) => x)),
        "first_air_date":
            "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "in_production": inProduction,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "last_air_date":
            "${lastAirDate.year.toString().padLeft(4, '0')}-${lastAirDate.month.toString().padLeft(2, '0')}-${lastAirDate.day.toString().padLeft(2, '0')}",
        "last_episode_to_air": lastEpisodeToAir.toJson(),
        "name": name,
        "next_episode_to_air": nextEpisodeToAir,
        "networks": List<dynamic>.from(networks.map((x) => x.toJson())),
        "number_of_episodes": numberOfEpisodes,
        "number_of_seasons": numberOfSeasons,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies":
            List<dynamic>.from(productionCompanies.map((x) => x)),
        "production_countries":
            List<dynamic>.from(productionCountries.map((x) => x)),
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
        "spoken_languages":
            List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "type": type,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  Genre copyWith({
    int? id,
    String? name,
  }) =>
      Genre(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class LastEpisodeToAir {
  DateTime airDate;
  int episodeNumber;
  int id;
  String name;
  String overview;
  dynamic productionCode;
  int seasonNumber;
  dynamic stillPath;
  double voteAverage;
  int voteCount;

  LastEpisodeToAir({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  LastEpisodeToAir copyWith({
    DateTime? airDate,
    int? episodeNumber,
    int? id,
    String? name,
    String? overview,
    dynamic productionCode,
    int? seasonNumber,
    dynamic stillPath,
    double? voteAverage,
    int? voteCount,
  }) =>
      LastEpisodeToAir(
        airDate: airDate ?? this.airDate,
        episodeNumber: episodeNumber ?? this.episodeNumber,
        id: id ?? this.id,
        name: name ?? this.name,
        overview: overview ?? this.overview,
        productionCode: productionCode ?? this.productionCode,
        seasonNumber: seasonNumber ?? this.seasonNumber,
        stillPath: stillPath ?? this.stillPath,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory LastEpisodeToAir.fromRawJson(String str) =>
      LastEpisodeToAir.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      LastEpisodeToAir(
        airDate: DateTime.parse(json["air_date"]),
        episodeNumber: json["episode_number"],
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        productionCode: json["production_code"],
        seasonNumber: json["season_number"],
        stillPath: json["still_path"],
        voteAverage: (json["vote_average"] as num?)?.toDouble() ?? 0.0,
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "air_date":
            "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
        "episode_number": episodeNumber,
        "id": id,
        "name": name,
        "overview": overview,
        "production_code": productionCode,
        "season_number": seasonNumber,
        "still_path": stillPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class Network {
  int id;
  String name;
  String logoPath;
  String originCountry;

  Network({
    required this.id,
    required this.name,
    required this.logoPath,
    required this.originCountry,
  });

  Network copyWith({
    int? id,
    String? name,
    String? logoPath,
    String? originCountry,
  }) =>
      Network(
        id: id ?? this.id,
        name: name ?? this.name,
        logoPath: logoPath ?? this.logoPath,
        originCountry: originCountry ?? this.originCountry,
      );

  factory Network.fromRawJson(String str) => Network.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json["id"],
        name: json["name"],
        logoPath: json["logo_path"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo_path": logoPath,
        "origin_country": originCountry,
      };
}

class Season {
  DateTime airDate;
  int episodeCount;
  int id;
  String name;
  String overview;
  dynamic posterPath;
  int seasonNumber;

  Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

  Season copyWith({
    DateTime? airDate,
    int? episodeCount,
    int? id,
    String? name,
    String? overview,
    dynamic posterPath,
    int? seasonNumber,
  }) =>
      Season(
        airDate: airDate ?? this.airDate,
        episodeCount: episodeCount ?? this.episodeCount,
        id: id ?? this.id,
        name: name ?? this.name,
        overview: overview ?? this.overview,
        posterPath: posterPath ?? this.posterPath,
        seasonNumber: seasonNumber ?? this.seasonNumber,
      );

  factory Season.fromRawJson(String str) => Season.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        airDate: DateTime.parse(json["air_date"]),
        episodeCount: json["episode_count"],
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        seasonNumber: json["season_number"],
      );

  Map<String, dynamic> toJson() => {
        "air_date":
            "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
        "episode_count": episodeCount,
        "id": id,
        "name": name,
        "overview": overview,
        "poster_path": posterPath,
        "season_number": seasonNumber,
      };
}

class SpokenLanguage {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  SpokenLanguage copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) =>
      SpokenLanguage(
        englishName: englishName ?? this.englishName,
        iso6391: iso6391 ?? this.iso6391,
        name: name ?? this.name,
      );

  factory SpokenLanguage.fromRawJson(String str) =>
      SpokenLanguage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
