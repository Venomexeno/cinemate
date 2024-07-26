import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_keys.dart';
import 'package:cinemate/core/constants/app_routes.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/core/services/service_locator.dart';
import 'package:cinemate/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:cinemate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:cinemate/features/auth/presentation/widgets/auth_elevated_button.dart';
import 'package:cinemate/features/auth/presentation/widgets/scrolling_movies.dart';
import 'package:cinemate/features/auth/presentation/widgets/sign_in_page_widgets/sign_in_form_section.dart';
import 'package:cinemate/features/auth/presentation/widgets/sign_in_page_widgets/sign_up_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
      linearGradientStops: const [0, 0.38],
      columnChildren: [
        const SizedBox(
          width: 80,
          child: Divider(
            height: 1,
            thickness: 2,
          )
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
        const SizedBox(height: 39),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) async {
            if (state is SignInSuccess) {
              if (state.user.emailVerified) {
                final token = await state.user.getIdToken();
                await sl<FlutterSecureStorage>()
                    .write(key: AppKeys.kToken, value: token);
                if (context.mounted) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.rootPageRoute, (route) => false);
                }
              } else {
                await state.user.sendEmailVerification();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppColors.red,
                      content: Text(AppStrings.emailNotVerified),
                    ),
                  );
                }
              }
            } else if (state is SignInFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.red,
                  content: Text(state.errMessage),
                ),
              );
            }
          },
          builder: (context, state) {
            return AuthElevatedButton(
              isLoading: state is SignInLoading,
              text: AppStrings.signIn,
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      parameters: SignInParameters(
                          email: _emailController.text,
                          password: _passwordController.text),
                    );
              },
            );
          },
        ),
        const SizedBox(height: 51),
        const SignUpTextRow(),
        const SizedBox(height: 32),
      ],
    );
  }
}
