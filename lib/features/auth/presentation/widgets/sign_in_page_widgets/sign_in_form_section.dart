import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/features/auth/presentation/widgets/auth_password_form_field.dart';
import 'package:cinemate/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:flutter/material.dart';

class SignInFormSection extends StatelessWidget {
  const SignInFormSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextFormField(
            hintText: AppStrings.email,
            controller: emailController,
          ),
          const SizedBox(height: 21),
          AuthPasswordFormField(
            hintText: AppStrings.password,
            controller: passwordController,
          ),
        ],
      ),
    );
  }
}
