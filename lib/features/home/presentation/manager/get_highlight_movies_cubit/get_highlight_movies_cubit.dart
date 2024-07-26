import 'package:cinemate/features/home/domain/entities/movie_entity.dart';
import 'package:cinemate/features/home/domain/use_cases/get_highlighted_movies_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_highlight_movies_state.dart';

class GetHighlightMoviesCubit extends Cubit<GetHighlightMoviesState> {
  GetHighlightMoviesCubit(this._getHighlightedMoviesUseCase)
      : super(GetHighlightMoviesInitial());

  final GetHighlightedMoviesUseCase _getHighlightedMoviesUseCase;

  Future<void> getHighlightedMovies() async {
    emit(GetHighlightMoviesLoading());
    final result = await _getHighlightedMoviesUseCase();
    result.fold(
      (failure) => emit(GetHighlightMoviesFailure(errMessage: failure.message)),
      (movies) => emit(
        GetHighlightMoviesSuccess(
          movies: movies,
        ),
      ),
    );
  }
}
