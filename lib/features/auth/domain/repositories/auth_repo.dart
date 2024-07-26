import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:cinemate/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo{
  Future<Either<Failure,User>> signIn(SignInParameters parameters);
  Future<Either<Failure,User>> signUp(SignUpParameters parameters);
}