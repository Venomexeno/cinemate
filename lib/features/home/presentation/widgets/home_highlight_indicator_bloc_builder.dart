import 'package:cinemate/features/home/presentation/manager/get_highlight_movies_cubit/get_highlight_movies_cubit.dart';
import 'package:cinemate/features/home/presentation/widgets/home_highlight_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHighlightIndicatorBlocBuilder extends StatelessWidget {
  const HomeHighlightIndicatorBlocBuilder({
    super.key,
    required this.currentPageNotifier,
  });

  final ValueNotifier<int> currentPageNotifier;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHighlightMoviesCubit, GetHighlightMoviesState>(
      builder: (context, state) {
        if (state is GetHighlightMoviesSuccess) {
          return HomeHighlightIndicator(
            indicatorLength: state.movies.length,
            currentPageNotifier: currentPageNotifier,
          );
        } else {
          return const SizedBox(height: 7); // Height of the indicator
        }
      },
    );
  }
}
