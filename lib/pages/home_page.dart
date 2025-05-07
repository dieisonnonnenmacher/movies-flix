import 'package:flutter/material.dart';
import 'package:movies_flix/components/loading_movie_list.dart';
import 'package:movies_flix/components/movie_card.dart';
import 'package:movies_flix/components/movie_list_error.dart';
import 'package:movies_flix/repositories/movie_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

        FutureBuilder(
          future: MovieRepository().getMovies(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingMovieList();
            }
            if (snapshot.hasError) {
              return MovieListError(onRetry: () {});
            }
            final movies = snapshot.data ?? [];

            return SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MovieCard(movie: movies[index]);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
