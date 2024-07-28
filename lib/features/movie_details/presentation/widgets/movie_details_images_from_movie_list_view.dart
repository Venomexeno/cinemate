import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieDetailsImagesFromMovieListView extends StatelessWidget {
  const MovieDetailsImagesFromMovieListView({
    super.key,
    required this.movies,
  });

  final List<String> movies;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: movies.asMap().entries.map((entry) {
          return Padding(
            padding: entry.key == movies.length - 1
                ? const EdgeInsets.only(right: 0)
                : const EdgeInsets.only(right: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: CachedNetworkImage(
                imageUrl:entry.value,
                width: 267,
                height: 154,
                fit: BoxFit.fill,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
