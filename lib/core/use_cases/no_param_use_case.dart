import 'package:cinemate/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}