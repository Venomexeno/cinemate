import 'package:cinemate/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:cinemate/features/movie_details/domain/use_cases/get_movie_details_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_movie_details_state.dart';

class GetMovieDetailsCubit extends Cubit<GetMovieDetailsState> {
  GetMovieDetailsCubit(this._getMovieDetailsUseCase)
      : super(GetMovieDetailsInitial());

  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  Future<void> getMovieDetails(String movieId) async {
    emit(GetMovieDetailsLoading());
    final result = await _getMovieDetailsUseCase(movieId);
    result.fold(
      (failure) => emit(GetMovieDetailsFailure(errMessage: failure.toString())),
      (movieDetails) => emit(GetMovieDetailsSuccess(movieDetails: movieDetails)),
    );
  }
}
