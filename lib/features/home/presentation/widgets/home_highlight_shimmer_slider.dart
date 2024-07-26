import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemate/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeHighlightShimmerSlider extends StatelessWidget {
  const HomeHighlightShimmerSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
      ),
      itemCount: 4,
      itemBuilder: (context, index, realIndex) {
        return Shimmer.fromColors(
          baseColor: AppColors.black,
          highlightColor: AppColors.darkPurple.withOpacity(0),
          child: Container(
            width: double.infinity,
            height: 175,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: AppColors.black),
          ),
        );
        // return ClipRRect(
        //   borderRadius: BorderRadius.circular(13),
        //   child: CachedNetworkImage(
        //     imageUrl: movie.imageUrl,
        //     fit: BoxFit.fill,
        //     width: double.infinity,
        //     height: 175,
        //   ),
        // );
      },
    );
  }
}
