import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class SessionSelectionMovieData extends StatelessWidget {
  const SessionSelectionMovieData({
    super.key,
    required this.movieCoverUrl,
    required this.movieName,
    required this.movieCompany,
  });

  final String movieCoverUrl;
  final String movieName;
  final String movieCompany;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 228,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: CachedNetworkImage(
                imageUrl: movieCoverUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(13),
                bottomRight: Radius.circular(13),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 7,
                  sigmaY: 7,
                ),
                child: Container(
                  width: double.infinity,
                  color: AppColors.black.withOpacity(0.3),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(movieName, style: AppStyles.semiBold20),
                      const SizedBox(height: 3),
                      Text(movieCompany, style: AppStyles.light11),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
