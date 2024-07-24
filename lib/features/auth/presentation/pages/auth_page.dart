import 'package:cinemate/features/auth/presentation/widgets/auth_page_widgets/auth_page_body.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthPageBody(),
    );
  }
}
