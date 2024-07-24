import 'package:cinemate/features/auth/presentation/widgets/sign_in_page_widgets/sign_in_page_body.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:SignInPageBody(),
    );
  }
}
