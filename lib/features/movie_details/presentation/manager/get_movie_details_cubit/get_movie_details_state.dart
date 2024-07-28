part of 'get_movie_details_cubit.dart';

sealed class GetMovieDetailsState extends Equatable {
  const GetMovieDetailsState();

  @override
  List<Object> get props => [];
}

final class GetMovieDetailsInitial extends GetMovieDetailsState {}

final class GetMovieDetailsLoading extends GetMovieDetailsState {}

final class GetMovieDetailsSuccess extends GetMovieDetailsState {
  final MovieDetailsEntity movieDetails;

  const GetMovieDetailsSuccess({required this.movieDetails});

  @override
  List<Object> get props => [movieDetails];
}

final class GetMovieDetailsFailure extends GetMovieDetailsState {
  final String errMessage;

  const GetMovieDetailsFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
