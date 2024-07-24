import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/features/auth/presentation/widgets/auth_elevated_button.dart';
import 'package:cinemate/features/auth/presentation/widgets/scrolling_movies.dart';
import 'package:cinemate/features/auth/presentation/widgets/sign_in_page_widgets/sign_in_form_section.dart';
import 'package:cinemate/features/auth/presentation/widgets/sign_in_page_widgets/sign_up_text_row.dart';
import 'package:flutter/material.dart';

class SignInPageBody extends StatefulWidget {
  const SignInPageBody({super.key});

  @override
  State<SignInPageBody> createState() => _SignInPageBodyState();
}

class _SignInPageBodyState extends State<SignInPageBody> {
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
      linearGradientStops: const [
        0,
        0.38,
      ],
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
        SignInFormSection(
          emailController: _emailController,
          passwordController: _passwordController,
          formKey: _formKey,
        ),
        Column(
          children: [
            const SizedBox(height: 39),
            AuthElevatedButton(
              text: AppStrings.signIn,
              onPressed: () {},
            ),
            const SizedBox(height: 51),
            const SignUpTextRow(),
            const SizedBox(height: 32),
          ],
        ),
      ],
    );
  }
}
