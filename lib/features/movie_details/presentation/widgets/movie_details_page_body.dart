import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/features/movie_details/presentation/manager/get_movie_details_cubit/get_movie_details_cubit.dart';
import 'package:cinemate/features/movie_details/presentation/widgets/movie_details_buy_ticket_button.dart';
import 'package:cinemate/features/movie_details/presentation/widgets/movie_details_cover_image.dart';
import 'package:cinemate/features/movie_details/presentation/widgets/movie_details_images_from_movie_list_view.dart';
import 'package:cinemate/features/movie_details/presentation/widgets/movie_details_movie_data.dart';
import 'package:cinemate/features/movie_details/presentation/widgets/movie_details_section_header.dart';
import 'package:cinemate/features/movie_details/presentation/widgets/movie_details_movie_subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsPageBody extends StatelessWidget {
  const MovieDetailsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<GetMovieDetailsCubit, GetMovieDetailsState>(
          builder: (context, state) {
            if (state is GetMovieDetailsSuccess) {
              final movieDetails = state.movieDetails;
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    MovieDetailsCoverImage(
                      coverUrl: movieDetails.coverUrl,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 306 - (197 / 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 21),
                            child: MovieDetailsMovieData(
                              title: movieDetails.name,
                              company: movieDetails.company,
                              imdbRating: movieDetails.imbdRating,
                              posterUrl: movieDetails.posterUrl,
                              rating: movieDetails.rating,
                            ),
                          ),
                          const SizedBox(height: 35),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 21),
                            child: MovieDetailsSectionHeader(
                              sectionTitle: AppStrings.movieSubject,
                            ),
                          ),
                          const SizedBox(height: 20),
                          MovieDetailsMovieSubject(
                            movieSubject: movieDetails.subject,
                          ),
                          const SizedBox(height: 35),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 21),
                            child: MovieDetailsSectionHeader(
                              sectionTitle: AppStrings.imagesFromTheMovie,
                            ),
                          ),
                          const SizedBox(height: 20),
                          MovieDetailsImagesFromMovieListView(movies: movieDetails.movieImages),
                          const SizedBox(height: 104),
                          // Height of the Buy Ticket Button
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is GetMovieDetailsFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: AppStyles.regular16,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              );
            }
          },
        ),
        const MovieDetailsBuyTicketButton(),
      ],
    );
  }
}

