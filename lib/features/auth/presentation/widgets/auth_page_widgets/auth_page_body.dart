import 'package:cinemate/core/constants/app_routes.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/features/auth/presentation/widgets/auth_elevated_button.dart';
import 'package:cinemate/features/auth/presentation/widgets/auth_page_widgets/or_row.dart';
import 'package:cinemate/features/auth/presentation/widgets/scrolling_movies.dart';
import 'package:flutter/material.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollingMovies(
      linearGradientStops: const [
        0,
        0.56,
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
        const SizedBox(height: 77),
        AuthElevatedButton(
          text: AppStrings.signIn,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.signInPageRoute);
          },
        ),
        const SizedBox(
          height: 17,
        ),
        const OrRow(),
        const SizedBox(height: 17),
        AuthElevatedButton(
          text: AppStrings.signUp,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.signUpPageRoute);

          },
        ),
        const SizedBox(
          height: 48,
        ),
      ],
    );
  }
}
