import 'package:firebase_auth/firebase_auth.dart';

class Failure {
  final String message;

  Failure(this.message);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.message);

  factory FirebaseFailure.fromAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-credential':
        return FirebaseFailure(
            'Please Check Your email and password then try again');
      case 'too-many-requests':
        return FirebaseFailure(
            'Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later');
      case 'user-disabled':
        return FirebaseFailure('This user is disabled, Please Contact us');
      case 'user-not-found':
        return FirebaseFailure('User not found');
      case 'invalid-email':
        return FirebaseFailure('Please Enter an Valid email');
      case 'email-already-in-use':
        return FirebaseFailure('This email already in use');
      case 'network-request-failed':
        return FirebaseFailure('Please check your internet then try again');

      default:
        return FirebaseFailure('Unknown error occurred');
    }
  }
}