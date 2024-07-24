import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/features/auth/presentation/widgets/auth_elevated_button.dart';
import 'package:cinemate/features/auth/presentation/widgets/scrolling_movies.dart';
import 'package:cinemate/features/auth/presentation/widgets/sign_up_page_widgets/sign_in_text_row.dart';
import 'package:cinemate/features/auth/presentation/widgets/sign_up_page_widgets/sign_up_form_section.dart';
import 'package:flutter/material.dart';

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({super.key});

  @override
  State<SignUpPageBody> createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollingMovies(
      linearGradientStops: const [0, 0.38],
      columnChildren: [
        const SizedBox(
          width: 80,
          child: Divider(
            height: 1,
            thickness: 2,
          ),
        ),
        Text(
          AppStrings.cine,
          style: AppStyles.semiBold27,
        ),
        Text(
          AppStrings.mate,
          style: AppStyles.semiBold27,
        ),
        const SizedBox(
          width: 80,
          child: Divider(
            height: 1,
            thickness: 2,
          ),
        ),
        const SizedBox(height: 60),
        SignUpFormSection(
          formKey: _formKey,
          emailController: _emailController,
          passwordController: _passwordController,
        ),
        const SizedBox(height: 39),
        AuthElevatedButton(
          text: AppStrings.signUp,
          onPressed: () {},
        ),
        const SizedBox(height: 51),
        const SignInTextRow(),
        const SizedBox(height: 32),

      ],
    );
  }
}
