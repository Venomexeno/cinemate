import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/features/home/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class HomeHighlightSlider extends StatelessWidget {
  const HomeHighlightSlider({
    super.key,
    required this.movies,
    required this.onPageChanged,
  });

  final List<MovieEntity> movies;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        onPageChanged: (index, reason) {
          onPageChanged(index);
        },
      ),
      itemCount: movies.length,
      itemBuilder: (context, index, realIndex) {
        final movie = movies[index];
        return Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: CachedNetworkImage(
                  imageUrl:movie.imageUrl,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 175,
                )
              ),
            ),
            Positioned(
              bottom: 18,
              left: 18,
              child: Text(
                movie.name,
                style: AppStyles.semiBold20,
              ),
            ),
          ]
        );
      },
    );
  }
}
