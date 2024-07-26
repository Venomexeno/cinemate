part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {
  final User user;

  const SignInSuccess({required this.user});

  @override
  List<Object> get props => [
        user,
      ];
}

final class SignInFailure extends AuthState {
  final String errMessage;

  const SignInFailure({required this.errMessage});

  @override
  List<Object> get props => [
        errMessage,
      ];
}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {
  final User user;

  const SignUpSuccess({required this.user});

  @override
  List<Object> get props => [
        user,
      ];
}

final class SignUpFailure extends AuthState {
  final String errMessage;

  const SignUpFailure({required this.errMessage});

  @override
  List<Object> get props => [
        errMessage,
      ];
}
