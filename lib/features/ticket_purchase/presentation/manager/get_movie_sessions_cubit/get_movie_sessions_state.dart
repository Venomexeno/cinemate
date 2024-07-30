part of 'get_movie_sessions_cubit.dart';

sealed class GetMovieSessionsState extends Equatable {
  const GetMovieSessionsState();

  @override
  List<Object> get props => [];
}

final class GetMovieSessionsInitial extends GetMovieSessionsState {}

final class GetMovieSessionsLoading extends GetMovieSessionsState {}

final class GetMovieSessionsSuccess extends GetMovieSessionsState {
  final List<MovieSessionEntity> movieSessions;

  const GetMovieSessionsSuccess({required this.movieSessions});

  @override
  List<Object> get props => [movieSessions];
}

final class GetMovieSessionsFailure extends GetMovieSessionsState {
  final String errMessage;

  const GetMovieSessionsFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
