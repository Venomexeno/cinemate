import 'package:cinemate/features/home/presentation/manager/get_highlight_movies_cubit/get_highlight_movies_cubit.dart';
import 'package:cinemate/features/home/presentation/widgets/home_highlight_shimmer_slider.dart';
import 'package:cinemate/features/home/presentation/widgets/home_highlight_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHighlightSliderBlocBuilder extends StatelessWidget {
  const HomeHighlightSliderBlocBuilder({
    super.key,
    required this.currentPageNotifier,
  });

  final ValueNotifier<int> currentPageNotifier;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHighlightMoviesCubit, GetHighlightMoviesState>(
      builder: (context, state) {
        if (state is GetHighlightMoviesSuccess) {

          return HomeHighlightSlider(
            onPageChanged: (index) {
              currentPageNotifier.value = index;
            },
            movies: state.movies,
          );
        } else if (state is GetHighlightMoviesFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const HomeHighlightShimmerSlider();
        }
      },
    );
  }
}

