import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure,MovieDetailsEntity>> getMovieDetails(String movieId);
}
