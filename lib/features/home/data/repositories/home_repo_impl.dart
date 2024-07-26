import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:cinemate/features/home/domain/entities/movie_entity.dart';
import 'package:cinemate/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getHighlightedMovies() async {
    try {
      final movies = await _homeRemoteDataSource.getHighlightedMovies();
      return Right(movies);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromAuth(e));
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getMoviesInTheaters() async {
    try {
      final movies = await _homeRemoteDataSource.getMoviesInTheaters();
      return Right(movies);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromAuth(e));
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getComingSoonMovies() async {
    try {
      final movies = await _homeRemoteDataSource.getComingSoonMovies();
      return Right(movies);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromAuth(e));
      }
      return Left(Failure(e.toString()));
    }
  }
}
