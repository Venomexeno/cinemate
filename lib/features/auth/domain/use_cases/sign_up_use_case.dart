import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/core/use_cases/use_case.dart';
import 'package:cinemate/features/auth/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpUseCase extends UseCase<User, SignUpParameters> {
  final AuthRepo _authRepo;

  SignUpUseCase(this._authRepo);

  @override
  Future<Either<Failure, User>> call(
      SignUpParameters parameters) async {
    return await _authRepo.signUp(parameters);
  }
}

class SignUpParameters extends Equatable {
  final String email;
  final String password;

  const SignUpParameters({required this.email, required this.password});

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
