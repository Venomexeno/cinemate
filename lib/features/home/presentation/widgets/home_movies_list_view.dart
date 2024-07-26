import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemate/core/constants/app_routes.dart';
import 'package:cinemate/features/home/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class HomeMoviesListView extends StatelessWidget {
  const HomeMoviesListView({
    super.key,
    required this.movies,
    this.isClickable = true,
  });

  final List<MovieEntity> movies;
  final bool isClickable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: movies.asMap().entries.map((entry) {
          final movie = entry.value;
          return Padding(
            padding: entry.key == movies.length - 1
                ? const EdgeInsets.only(right: 0)
                : const EdgeInsets.only(right: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: GestureDetector(
                onTap: () {
                  if (!isClickable) {
                    return;
                  } else {
                    Navigator.of(context).pushNamed(
                      AppRoutes.movieDetailsPageRoute,
                      arguments: movie.id,
                    );
                  }
                },
                child: CachedNetworkImage(
                  imageUrl: movie.imageUrl,
                  width: 153,
                  height: 204,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
