import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/core/use_cases/no_param_use_case.dart';
import 'package:cinemate/features/home/domain/entities/movie_entity.dart';
import 'package:cinemate/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetMoviesInTheatersUseCase extends UseCase<List<MovieEntity>> {
  final HomeRepo _homeRepo;

  GetMoviesInTheatersUseCase(this._homeRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await _homeRepo.getMoviesInTheaters();
  }
}
