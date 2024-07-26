part of 'get_movies_in_theaters_cubit.dart';

sealed class GetMoviesInTheatersState extends Equatable {
  const GetMoviesInTheatersState();

  @override
  List<Object> get props => [];
}

final class GetMoviesInTheatersInitial extends GetMoviesInTheatersState {}

final class GetMoviesInTheatersLoading extends GetMoviesInTheatersState {}

final class GetMoviesInTheatersSuccess extends GetMoviesInTheatersState {
  final List<MovieEntity> movies;

  const GetMoviesInTheatersSuccess({required this.movies});

  @override
  List<Object> get props => [movies];
}

final class GetMoviesInTheatersFailure extends GetMoviesInTheatersState {
  final String errMessage;

  const GetMoviesInTheatersFailure({
    required this.errMessage,
  });

  @override
  List<Object> get props => [
        errMessage,
      ];
}