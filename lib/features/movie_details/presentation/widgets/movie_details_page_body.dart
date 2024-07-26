import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/features/movie_details/presentation/widgets/movie_details_buy_ticket_button.dart';
import 'package:cinemate/features/movie_details/presentation/widgets/movie_details_cover_image.dart';
import 'package:cinemate/features/movie_details/presentation/widgets/movie_details_movie_data.dart';
import 'package:flutter/material.dart';

class MovieDetailsPageBody extends StatelessWidget {
  const MovieDetailsPageBody({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SingleChildScrollView(
          child: Stack(
            children: [
              MovieDetailsCoverImage(),
              Padding(
                padding: EdgeInsets.only(
                  top: 306 - (197 / 2),
                  left: 21,
                  right: 21,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieDetailsMovieData(),
                    SizedBox(height: 35),
                    Text(
                      'data',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        MovieDetailsBuyTicketButton(),
      ],
    );
  }
}
