import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/features/home/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieEntity>>> getHighlightedMovies();
  Future<Either<Failure, List<MovieEntity>>> getMoviesInTheaters();
  Future<Either<Failure, List<MovieEntity>>> getComingSoonMovies();
}
