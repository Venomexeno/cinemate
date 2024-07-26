import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class AuthElevatedButton extends StatelessWidget {
  const AuthElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  final String text;
  final bool isLoading;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 57),
        backgroundColor: AppColors.darkPurple.withOpacity(0.4),
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      onPressed: onPressed,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.white,
              ),
            )
          : Text(
              text,
              style: AppStyles.medium20.copyWith(
                shadows: [
                  const Shadow(
                    blurRadius: 3.0,
                    color: AppColors.white,
                    offset: Offset(0, 0),
                  ),
                  const Shadow(
                    blurRadius: 8.0,
                    color: AppColors.white,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
    );
  }
}
