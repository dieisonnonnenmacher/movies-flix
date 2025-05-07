import 'package:flutter/material.dart';
import 'package:movies_flix/models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.movie, super.key});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final path = 'https://image.tmdb.org/t/p/original${movie.imagePath}';
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Image.network(
        path,
        errorBuilder:
            (context, error, StackTrace) => Container(color: Colors.grey),
        fit: BoxFit.cover,
        height: 180,
        width: 120,
      ),
    );
  }
}
