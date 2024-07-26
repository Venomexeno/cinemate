import 'package:cinemate/features/home/domain/entities/movie_entity.dart';
import 'package:cinemate/features/home/domain/use_cases/get_coming_soon_movies_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_coming_soon_movies_state.dart';

class GetComingSoonMoviesCubit extends Cubit<GetComingSoonMoviesState> {
  GetComingSoonMoviesCubit(this._getComingSoonMoviesUseCase)
      : super(GetComingSoonMoviesInitial());

  final GetComingSoonMoviesUseCase _getComingSoonMoviesUseCase;

  Future<void> getComingSoonMovies() async {
    emit(GetComingSoonMoviesLoading());
    final result = await _getComingSoonMoviesUseCase();
    result.fold(
      (failure) => emit(GetComingSoonMoviesFailure(errMessage: failure.message)),
      (movies) {
        emit(
          GetComingSoonMoviesSuccess(
            movies: movies,
          ),
        );
      },
    );
  }
}
