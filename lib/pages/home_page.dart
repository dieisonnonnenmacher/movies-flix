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
  final String _popular = 'popular';
  final String _topRated = 'top_rated';
  final String _upcoming = 'upcoming';
  final String _nowPlaying = 'now_playing';

  late MovieRepository movieRepository;

  late List<Movie> popularMovies = [];
  late List<Movie> topRateMovies = [];
  late List<Movie> upcomingMovies = [];
  late List<Movie> nowPlaying = [];

  @override
  void initState() {
    movieRepository = MovieRepository();
    getMoviesInit();
    super.initState();
  }

  Future<void> getMoviesInit() async {
    getMovies(_popular);
    getMovies(_topRated);
    getMovies(_upcoming);
    getMovies(_nowPlaying);
  }

  Future<void> getMovies(String category) async {
    List<Movie> movies = [];
    final moviesDb = await movieRepository.getMoviesDb(category);
    if (moviesDb.isNotEmpty) {
      setState(() {
        movies = moviesDb;
      });
    } else {
      final moviesApi = await movieRepository.getMovies(category);
      if (moviesApi.isNotEmpty) {
        setState(() {
          movies = moviesApi;
        });
      }
    }
    switch (category) {
      case 'popular':
        popularMovies = movies;
        break;
      case 'top_rated':
        topRateMovies = movies;
        break;
      case 'upcoming':
        upcomingMovies = movies;
        break;
      case 'now_playing':
        nowPlaying = movies;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/gladiador.jpg",
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(height: 10),
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
                itemCount: popularMovies.length,
                itemBuilder: (context, index) {
                  if (popularMovies.isEmpty) {
                    return LoadingMovieList();
                  }
                  return MovieCard(movie: popularMovies[index]);
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Top Rate Movies',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRateMovies.length,
                itemBuilder: (context, index) {
                  if (topRateMovies.isEmpty) {
                    return LoadingMovieList();
                  }
                  return MovieCard(movie: topRateMovies[index]);
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Upcoming Movies',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upcomingMovies.length,
                itemBuilder: (context, index) {
                  if (upcomingMovies.isEmpty) {
                    return LoadingMovieList();
                  }
                  return MovieCard(movie: upcomingMovies[index]);
                },
              ),
            ),

            const SizedBox(height: 10),
            const Text(
              'Now Playing',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nowPlaying.length,
                itemBuilder: (context, index) {
                  if (nowPlaying.isEmpty) {
                    return LoadingMovieList();
                  }
                  return MovieCard(movie: nowPlaying[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
