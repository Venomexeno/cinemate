import 'package:cinemate/features/home/domain/entities/movie_entity.dart';
import 'package:cinemate/features/home/domain/use_cases/get_movies_in_theaters_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_movies_in_theaters_state.dart';

class GetMoviesInTheatersCubit extends Cubit<GetMoviesInTheatersState> {
  GetMoviesInTheatersCubit(this._getMoviesInTheatersUseCase) : super(GetMoviesInTheatersInitial());

  final GetMoviesInTheatersUseCase _getMoviesInTheatersUseCase;

  Future<void> getMoviesInTheaters() async {
    emit(GetMoviesInTheatersLoading());
    final result = await _getMoviesInTheatersUseCase();
    result.fold(
      (failure) => emit(GetMoviesInTheatersFailure(errMessage: failure.message)),
      (movies) => emit(GetMoviesInTheatersSuccess(movies: movies)),
    );
  }
}
