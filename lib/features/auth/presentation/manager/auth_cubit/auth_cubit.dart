import 'package:cinemate/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:cinemate/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._signInUseCase, this._signUpUseCase) : super(AuthInitial());

  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;

  Future<void> signIn({required SignInParameters parameters}) async {
    emit(SignInLoading());
    final result = await _signInUseCase(parameters);
    result.fold(
      (failure) => emit(SignInFailure(errMessage: failure.message)),
      (user) => emit(SignInSuccess(user: user)),
    );
  }

  Future<void> signUp({required SignUpParameters parameters}) async {
    emit(SignUpLoading());
    final result = await _signUpUseCase(parameters);
    result.fold(
      (failure) => emit(SignUpFailure(errMessage: failure.message)),
      (user) => emit(SignUpSuccess(user: user)),
    );
  }
}
