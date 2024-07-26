import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetailsMovieData extends StatelessWidget {
  const MovieDetailsMovieData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 197,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              width: 140,
              imageUrl:
                  "https://resizing.flixster.com/OBCMbeYEWS5tI2QhErFskxKyEa0=/206x305/v2/https://resizing.flixster.com/mPJp85eApHd8ih9XF5E9d3-2LbM=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzUxODlkZDE1LTQyYjUtNDg5ZS05NjZmLWMxZDk1YWZhN2E1ZC5qcGc=",
            ),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  'Deadpool & Wolverine',
                  style: AppStyles.semiBold20,
                ),
                const SizedBox(height: 3),
                Text('Marvel Studios', style: AppStyles.light11),
                const SizedBox(height: 7),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: 4,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star_rounded,
                        color: AppColors.goldenRod,
                      ),
                      unratedColor: AppColors.white,
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(width: 5),
                    Text('(4/5)', style: AppStyles.light11),
                  ],
                ),
                const SizedBox(height: 11),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.yellow,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'IMDb',
                        style: AppStyles.thick12,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text('8.5', style: AppStyles.light12),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
