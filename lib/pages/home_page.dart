import 'package:flutter/material.dart';
import 'package:movies_flix/components/loading_movie_list.dart';
import 'package:movies_flix/components/movie_card.dart';
import 'package:movies_flix/models/movie.dart';
import 'package:movies_flix/repositories/movie_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MovieRepository movieRepository;
  late List<Movie> movies = [];

  @override
  void initState() {
    movieRepository = MovieRepository();
    getMovies();
    super.initState();
  }

  Future<void> getMovies() async {
    final moviesDb = await movieRepository.getMoviesDb();
    if (moviesDb.isNotEmpty) {
      setState(() {
        movies = moviesDb;
      });
    } else {
      final moviesApi = await movieRepository.getMovies();
      if (moviesApi.isNotEmpty) {
        setState(() {
          movies = moviesApi;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/gladiador.jpg",
          fit: BoxFit.cover,
          height: 350,
          width: double.infinity,
        ),
        const SizedBox(height: 20),
        const Text(
          'Popular Movie',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              if (movies.isEmpty) {
                return LoadingMovieList();
              }
              return MovieCard(movie: movies[index]);
            },
          ),
        ),
      ],
    );
  }
}
