import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class MovieDetailsMovieSubject extends StatelessWidget {
  const MovieDetailsMovieSubject({
    super.key, required this.movieSubject,
  });

  final String movieSubject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: ReadMoreText(
        movieSubject,
        style: AppStyles.regular16,
        trimMode: TrimMode.Length,
        trimLength: 200,
        moreStyle: AppStyles.regular16.copyWith(
          color: AppColors.darkPurple,
          decoration: TextDecoration.underline,
          decorationThickness: 2,
        ),
        colorClickableText: AppColors.darkPurple,
        lessStyle: AppStyles.regular16.copyWith(
          color: AppColors.darkPurple,
          decoration: TextDecoration.underline,
          decorationThickness: 2,
        ),
        trimCollapsedText: AppStrings.seeAll,
        trimExpandedText: AppStrings.seeLess,
      ),
    );
  }
}
