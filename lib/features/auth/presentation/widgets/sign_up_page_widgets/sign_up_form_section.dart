import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextFormField(
            controller: emailController,
            hintText: AppStrings.email,
          ),
          const SizedBox(height: 21),
          AuthTextFormField(
            controller: passwordController,
            hintText: AppStrings.password,
          ),
        ],
      ),
    );
  }
}
