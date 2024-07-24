import 'package:cinemate/core/constants/app_routes.dart';
import 'package:cinemate/features/auth/presentation/pages/auth_page.dart';
import 'package:cinemate/features/auth/presentation/pages/sign_in_page.dart';
import 'package:cinemate/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class OnGenerateRoute {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.authPageRoute:
        return MaterialPageRoute(
          builder: (_) => const AuthPage(),
          settings: settings,
        );

      case AppRoutes.signInPageRoute:
        return MaterialPageRoute(
          builder: (_) => const SignInPage(),
          settings: settings,
        );

      case AppRoutes.signUpPageRoute:
        return MaterialPageRoute(
          builder: (_) => const SignUpPage(),
          settings: settings,
        );
    }
    return null;
  }
}
