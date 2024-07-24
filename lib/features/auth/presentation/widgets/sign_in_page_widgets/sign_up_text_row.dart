import 'package:cinemate/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';

class SignUpTextRow extends StatelessWidget {
  const SignUpTextRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppStrings.doNotYouHaveAnAccount,
        style: AppStyles.semiBold13, // White text
        children: [
          TextSpan(
            text: AppStrings.signUp,
            style: AppStyles.semiBold13.copyWith(
              color: AppColors.darkPurple,
              shadows: [
                const Shadow(
                  blurRadius: 3.0,
                  color: AppColors.darkPurple,
                  offset: Offset(0, 0),
                ),
                const Shadow(
                  blurRadius: 8.0,
                  color: AppColors.darkPurple,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, AppRoutes.signUpPageRoute);
              },
          ),
          TextSpan(
            text: AppStrings.now,
            style: AppStyles.semiBold13,
          ),
        ],
      ),
    );
  }
}
