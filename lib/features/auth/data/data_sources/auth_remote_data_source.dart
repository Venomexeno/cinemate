import 'package:cinemate/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:cinemate/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<User> signIn(SignInParameters parameters);
  Future<User> signUp(SignUpParameters parameters);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl(this._firebaseAuth);

  @override
  Future<User> signIn(SignInParameters parameters) async {
    UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: parameters.email,
      password: parameters.password,
    );
    return userCredential.user!;
  }

  @override
  Future<User> signUp(SignUpParameters parameters) async {
    UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: parameters.email,
      password: parameters.password,
    );
    return userCredential.user!;
  }
}
