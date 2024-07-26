part of 'get_highlight_movies_cubit.dart';


sealed class GetHighlightMoviesState extends Equatable {
  const GetHighlightMoviesState();

  @override
  List<Object> get props => [];
}

final class GetHighlightMoviesInitial extends GetHighlightMoviesState {}

final class GetHighlightMoviesLoading extends GetHighlightMoviesState {}

final class GetHighlightMoviesSuccess extends GetHighlightMoviesState {
  final List<MovieEntity> movies;

  const GetHighlightMoviesSuccess({required this.movies});

  @override
  List<Object> get props => [movies];
}

final class GetHighlightMoviesFailure extends GetHighlightMoviesState {
  final String errMessage;

  const GetHighlightMoviesFailure({
    required this.errMessage,
  });

  @override
  List<Object> get props => [
        errMessage,
      ];
}