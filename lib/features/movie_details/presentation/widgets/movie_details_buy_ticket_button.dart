import 'dart:ui';

import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_routes.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/features/auth/presentation/widgets/auth_elevated_button.dart';
import 'package:cinemate/features/movie_details/presentation/manager/get_movie_details_cubit/get_movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsBuyTicketButton extends StatelessWidget {
  const MovieDetailsBuyTicketButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 19.2,
            sigmaY: 19.2,
          ),
          child: Container(
            height: 104,
            color: AppColors.black.withOpacity(0.21),
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 26),
            child: BlocBuilder<GetMovieDetailsCubit, GetMovieDetailsState>(
              builder: (context, state) {
                return AuthElevatedButton(
                  onPressed: state is GetMovieDetailsSuccess
                      ? () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.ticketPurchasePageRoute,
                            arguments:{
                              'movieId': state.movieDetails.id,
                              'movieTitle': state.movieDetails.name,
                              'movieCover': state.movieDetails.coverUrl,
                              'movieCompany': state.movieDetails.company,
                            },
                          );
                        }
                      : null,
                  text: AppStrings.buyTicketNow,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
