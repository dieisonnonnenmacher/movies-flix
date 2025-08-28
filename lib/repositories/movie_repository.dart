import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movies_flix/app_config.dart';
import 'package:movies_flix/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieRepository {
  final Dio client = Dio(
    BaseOptions(
      baseUrl: AppConfig.instance.baseUrl,
      headers: {
        'Authorization': 'Bearer  ${AppConfig.instance.apiKey}',
        'accept': 'application/json',
      },
      queryParameters: {'language': 'pt-BR'},
    ),
  );

  SharedPreferences? _preferences;
  final String moviesKey = 'movies';

  FutureOr<SharedPreferences> get db async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  Future<void> saveMoviesDb(String categoryKey, List<Movie> movies) async {
    final storage = await db;
    storage.setStringList(
      categoryKey,
      movies.map((movie) => movie.toJson).toList(),
    );
  }

  Future<List<Movie>> getMoviesDb(String categoryKey) async {
    final storage = await db;

    final movies = storage.getStringList(categoryKey);

    if (movies == null || movies.isEmpty) {
      return [];
    }
    return movies.map((movie) => Movie.fromJson(jsonDecode(movie))).toList();
  }

  Future<List<Movie>> getMovies(String category) async {
    final response = await client.get(
      '/movie/$category',
      queryParameters: {'page': 1},
    );
    final movies =
        (response.data['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();
    saveMoviesDb(category, movies);

    return movies;
  }
}
