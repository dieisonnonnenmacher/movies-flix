import 'package:dio/dio.dart';
import 'package:movies_flix/app_config.dart';
import 'package:movies_flix/models/movie.dart';

class MovieRepository {
  final Dio client = Dio(
    BaseOptions(
      baseUrl: AppConfig.instance.baseUrl,
      headers: {'Authorization': 'Bearer '},
      queryParameters: {'language': 'pt-BR'},
    ),
  );

  Future<List<Movie>> getMovies() async {
    final response = await client.get(
      '/discovery/movie',
      queryParameters: {'page': 1},
    );
    print(response.data);
    return [];
  }
}
