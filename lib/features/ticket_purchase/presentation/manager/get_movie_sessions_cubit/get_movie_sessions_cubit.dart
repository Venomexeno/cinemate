import 'package:cinemate/features/ticket_purchase/domain/entities/movie_session_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/use_cases/get_movie_sessions_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_movie_sessions_state.dart';

class GetMovieSessionsCubit extends Cubit<GetMovieSessionsState> {
  GetMovieSessionsCubit(this._getMovieSessionsUseCase)
      : super(GetMovieSessionsInitial());

  final GetMovieSessionsUseCase _getMovieSessionsUseCase;

  Future<void> getMovieSessions(String movieId) async {
    emit(GetMovieSessionsLoading());
    final result = await _getMovieSessionsUseCase(movieId);
    result.fold(
      (failure) => emit(GetMovieSessionsFailure(errMessage: failure.message)),
      (movieSessions) => emit(GetMovieSessionsSuccess(movieSessions: movieSessions)),
    );
  }
}
