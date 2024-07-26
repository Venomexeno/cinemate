import 'package:cinemate/features/home/presentation/manager/get_coming_soon_movies_cubit/get_coming_soon_movies_cubit.dart';
import 'package:cinemate/features/home/presentation/widgets/home_movies_list_view.dart';
import 'package:cinemate/features/home/presentation/widgets/home_movies_shimmer_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeComingSoonMoviesBlocBuilder extends StatelessWidget {
  const HomeComingSoonMoviesBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetComingSoonMoviesCubit, GetComingSoonMoviesState>(
      builder: (context, state) {
        if (state is GetComingSoonMoviesSuccess) {
          final movies = state.movies;
          return HomeMoviesListView(movies: movies, isClickable: false);
        } else if (state is GetComingSoonMoviesFailure) {
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
