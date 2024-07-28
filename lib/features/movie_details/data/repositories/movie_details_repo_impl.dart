import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/features/movie_details/data/data_sources/movie_details_remote_data_source.dart';
import 'package:cinemate/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:cinemate/features/movie_details/domain/repositories/movie_details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final MovieDetailsRemoteDataSource _movieDetailsRemoteDataSource;

  MovieDetailsRepoImpl(this._movieDetailsRemoteDataSource);

  @override
  Future<Either<Failure,MovieDetailsEntity>> getMovieDetails(String movieId) async {
    try {
      final movies = await _movieDetailsRemoteDataSource.getMovieDetails(movieId);
      return Right(movies);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromAuth(e));
      }
      return Left(Failure(e.toString()));
    }
  }
}
