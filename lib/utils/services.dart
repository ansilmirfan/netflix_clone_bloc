import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:netflix_clone_bloc/models.dart/movie_details_model.dart';
import 'package:netflix_clone_bloc/models.dart/movies_model.dart';
import 'package:netflix_clone_bloc/models.dart/search_series.dart';
import 'package:netflix_clone_bloc/models.dart/trailer_model.dart';
import 'package:netflix_clone_bloc/models.dart/tv_seires_details_model.dart';
import 'package:netflix_clone_bloc/utils/api.dart';


String baseUrl = 'https://api.themoviedb.org/3/';
String key = '?api_key=$apiKey';

class ApiService {
  Future<SearchSeries> getPopularSeries() async {
    int attempts = 0;
    const int maxAttempts = 5;
    while (attempts < maxAttempts) {
      try {
        String endUrl = 'search/tv';
        final url = '$baseUrl$endUrl$key&query=game of thrones';
        final response = await http.get(Uri.parse(url));
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          return SearchSeries.fromJson(jsonDecode(response.body));
        } else if (response.statusCode >= 300) {
          throw 'Faled to load pupular series';
        }
      } catch (e) {
        log(e.toString());
        await Future.delayed(const Duration(seconds: 1));

        attempts++;
      }
    }
    throw 'Faled to load pupular series';
  }

  Future<MoviesModel> getTopRatedMovies() async {
    int attempts = 0;
    const int maxAttempts = 5;

    while (attempts < maxAttempts) {
      try {
        String endUrl = 'movie/top_rated';
        final url = '$baseUrl$endUrl$key';
        final response = await http.get(Uri.parse(url));
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          return MoviesModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode >= 300) {
          throw 'Faled to load pupular series';
        }
      } catch (e) {
        log(e.toString());
        await Future.delayed(const Duration(seconds: 1));

        attempts++;
      }
    }
    throw 'Faled to load pupular series';
  }

  Future<MoviesDetaisModel> getDetailsOfMovies(int id) async {
    int attempts = 0;
    const int maxAttempts = 5;

    while (attempts < maxAttempts) {
      try {
        String endUrl = 'movie/$id';
        final url = '$baseUrl$endUrl$key';
        final response = await http.get(Uri.parse(url));
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          return MoviesDetaisModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode >= 300) {
          throw 'Faled to details';
        }
      } catch (e) {
        log(e.toString());
        await Future.delayed(const Duration(seconds: 1));

        attempts++;
      }
    }
    throw 'Faled to details';
  }

  Future<MoviesModel> getRecommendedMovies(int id) async {
    int attempts = 0;
    const int maxAttempts = 5;

    while (attempts < maxAttempts) {
      try {
        String endUrl = 'movie/$id/recommendations';
        final url = '$baseUrl$endUrl$key&&page=2';
        final response = await http.get(Uri.parse(url));
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          return MoviesModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode >= 300) {
          throw 'Faled to load details';
        }
      } catch (e) {
        log(e.toString());
        await Future.delayed(const Duration(seconds: 1));

        attempts++;
      }
    }
    throw 'Faled to details';
  }

  Future<MoviesModel> searchMovies(String query) async {
    int attempts = 0;
    const int maxAttempts = 5;

    while (attempts < maxAttempts) {
      try {
        String endUrl = 'search/movie';
        final url = '$baseUrl$endUrl$key&query=$query';
        final response = await http.get(Uri.parse(url));
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          return MoviesModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode >= 300) {
          throw 'Faled to load pupular series';
        }
      } catch (e) {
        log(" this is ${e.toString()}");
        await Future.delayed(const Duration(seconds: 1));
        attempts++;
      }
    }
    throw 'Faled to load Search';
  }

  Future<MoviesModel> getUpcomingMovies() async {
    int attempts = 0;
    const int maxAttempts = 5;

    while (attempts < maxAttempts) {
      try {
        String endUrl = 'movie/upcoming';
        final url = '$baseUrl$endUrl$key';
        final response = await http.get(Uri.parse(url));
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          return MoviesModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode >= 300) {
          throw 'Faled to load upcoming movies';
        }
      } catch (e) {
        log(" this is ${e.toString()}");
        await Future.delayed(const Duration(seconds: 1));
        attempts++;
      }
    }
    throw 'Faled to load upcoming movies';
  }

  Future<MoviesModel> getTopRatedTvSeries() async {
    int attempts = 0;
    const int maxAttempts = 5;

    while (attempts < maxAttempts) {
      try {
        String endUrl = 'tv/top_rated';
        final url = '$baseUrl$endUrl$key';
        final response = await http.get(Uri.parse(url));
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          return MoviesModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode >= 300) {
          throw 'Faled to load top rated series';
        }
      } catch (e) {
        log(" this is ${e.toString()}");
        await Future.delayed(const Duration(seconds: 1));
        attempts++;
      }
    }
    throw 'Faled to load top rated series';
  }

  Future<TvSeriesDetailsModel> getDetailsTvSeries(int id) async {
    int attempts = 0;
    const int maxAttempts = 5;

    while (attempts < maxAttempts) {
      try {
        String endUrl = 'tv/$id';
        final url = '$baseUrl$endUrl$key';
        final response = await http.get(Uri.parse(url));
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          return TvSeriesDetailsModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode >= 300) {
          throw 'Faled to load tv series details';
        }
      } catch (e) {
        log(" this is ${e.toString()}");
        await Future.delayed(const Duration(seconds: 1));
        attempts++;
      }
    }
    throw 'Faled to load tv series details';
  }

  Future<MoviesModel> getRecommendedSeries(int id) async {
    int attempts = 0;
    const int maxAttempts = 5;

    while (attempts < maxAttempts) {
      try {
        String endUrl = 'tv/$id/recommendations';
        final url = '$baseUrl$endUrl$key&&page=2';
        final response = await http.get(Uri.parse(url));
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          return MoviesModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode >= 300) {
          throw 'Faled to details';
        }
      } catch (e) {
        log(e.toString());
        await Future.delayed(const Duration(seconds: 1));
        attempts++;
      }
    }
    throw 'Faled to details';
  }

  Future<VideoModel> getTrailerId(int id, {bool movie = true}) async {
    int attempts = 0;
    const int maxAttempts = 5;

    while (attempts < maxAttempts) {
      try {
        String endUrl = movie ? 'movie/$id/videos' : 'tv/$id/videos';
        final url = '$baseUrl$endUrl$key';
        final response = await http.get(Uri.parse(url));
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          return VideoModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode >= 300) {
          throw 'Faled to details';
        }
      } catch (e) {
        log(e.toString());
        await Future.delayed(const Duration(seconds: 1));

        attempts++;
      }
    }
    throw 'Faled to details';
  }
}
