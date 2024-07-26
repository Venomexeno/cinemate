part of 'get_coming_soon_movies_cubit.dart';

sealed class GetComingSoonMoviesState extends Equatable {
  const GetComingSoonMoviesState();

  @override
  List<Object> get props => [];
}

final class GetComingSoonMoviesInitial extends GetComingSoonMoviesState {}

final class GetComingSoonMoviesLoading extends GetComingSoonMoviesState {}

final class GetComingSoonMoviesSuccess extends GetComingSoonMoviesState {
  final List<MovieEntity> movies;

  const GetComingSoonMoviesSuccess({required this.movies});

  @override
  List<Object> get props => [movies];
}

final class GetComingSoonMoviesFailure extends GetComingSoonMoviesState {
  final String errMessage;

  const GetComingSoonMoviesFailure({
    required this.errMessage,
  });

  @override
  List<Object> get props => [
        errMessage,
      ];
}