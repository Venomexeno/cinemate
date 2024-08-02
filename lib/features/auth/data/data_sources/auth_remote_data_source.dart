import 'package:cinemate/core/constants/api_keys.dart';
import 'package:cinemate/core/constants/app_keys.dart';
import 'package:cinemate/core/services/api_service.dart';
import 'package:cinemate/core/services/service_locator.dart';
import 'package:cinemate/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:cinemate/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthRemoteDataSource {
  Future<User> signIn(SignInParameters parameters);

  Future<User> signUp(SignUpParameters parameters);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final ApiService _apiService;

  AuthRemoteDataSourceImpl(this._firebaseAuth, this._apiService);

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
    try {
      await _createCustomerInStripe(userCredential.user!.email!);
    } catch (e) {
      // Rollback: Delete the user if creating a customer in Stripe fails
      await userCredential.user!.delete();
      rethrow;
    }
    return userCredential.user!;
  }

  Future<void> _createCustomerInStripe(String email) async {
    try {
      var response = await _apiService.post(
        body: {
          'email': email,
        },
        url: 'https://api.stripe.com/v1/customers',
        contentType: Headers.formUrlEncodedContentType,
        token: ApiKeys.secretKey,
      );
      await sl<FlutterSecureStorage>()
          .write(key: AppKeys.kCustomerToken, value: response.data['id']);
    } catch (e) {
      throw Exception('Failed to create Stripe customer: $e');
    }
  }
}
