import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemate/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MovieDetailsCoverImage extends StatelessWidget {
  const MovieDetailsCoverImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
            fit: BoxFit.cover,
            height: 306,
            width: double.infinity,
            imageUrl:
            "https://resizing.flixster.com/NoO1q75sRFFMjgKKwPgDJEQoBRM=/1100x618/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p23093323_i_h10_ab.jpg"),
        Container(
          height: 306,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.black.withOpacity(0),
                const Color(0xFF0E0E0E),
              ],
              stops: const [
                0.35,
                0.90,
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 21, top: 21),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.darkPurple,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
