import 'dart:convert';


class VideoModel {
  int id;
  List<Result> results;

  VideoModel({
    required this.id,
    required this.results,
  });

  factory VideoModel.fromRawJson(String str) => VideoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    id: json["id"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}


class Result {
  String key; 

  Result({
    required this.key,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
  };
}


