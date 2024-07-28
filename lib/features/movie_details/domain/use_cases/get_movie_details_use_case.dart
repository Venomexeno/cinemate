import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/core/use_cases/use_case.dart';
import 'package:cinemate/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:cinemate/features/movie_details/domain/repositories/movie_details_repo.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetailsUseCase extends UseCase<MovieDetailsEntity, String> {
  final MovieDetailsRepo _movieDetailsRepo;

  GetMovieDetailsUseCase(this._movieDetailsRepo);
  @override
  Future<Either<Failure, MovieDetailsEntity>> call(String parameters) async {
    return await _movieDetailsRepo.getMovieDetails(parameters);
  }
}
