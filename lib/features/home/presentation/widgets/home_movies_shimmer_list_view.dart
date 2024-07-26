import 'package:cinemate/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeMoviesShimmerListView extends StatelessWidget {
  const HomeMoviesShimmerListView({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
            (index) {
              return Padding(
                padding: index == 3
                    ? const EdgeInsets.only(right: 0)
                    : const EdgeInsets.only(right: 12),
                child: Shimmer.fromColors(
                  baseColor: AppColors.black,
                  highlightColor: AppColors.darkPurple.withOpacity(0),
                  child: Container(
                    width: 153,
                    height: 204,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
