import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:cinemate/features/auth/domain/repositories/auth_repo.dart';
import 'package:cinemate/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:cinemate/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<Either<Failure, User>> signIn(
      SignInParameters parameters) async {
    try {
      final user = await _authRemoteDataSource.signIn(parameters);
      return Right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromAuth(e));
      } else {
        return Left(Failure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, User>> signUp(SignUpParameters parameters) async {
    try {
      final user = await _authRemoteDataSource.signUp(parameters);
      return Right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromAuth(e));
      } else {
        return Left(Failure(e.toString()));
      }
    }
  }
}
