import 'package:cinemate/features/home/presentation/manager/get_movies_in_theaters_cubit/get_movies_in_theaters_cubit.dart';
import 'package:cinemate/features/home/presentation/widgets/home_movies_list_view.dart';
import 'package:cinemate/features/home/presentation/widgets/home_movies_shimmer_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesInTheaterBlocBuilder extends StatelessWidget {
  const MoviesInTheaterBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMoviesInTheatersCubit, GetMoviesInTheatersState>(
      builder: (context, state) {
        if (state is GetMoviesInTheatersSuccess) {
          final movies = state.movies;
          return HomeMoviesListView(movies: movies);
        } else if (state is GetMoviesInTheatersFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const HomeMoviesShimmerListView();
        }
      },
    );
  }
}

