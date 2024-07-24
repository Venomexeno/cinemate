import 'package:cinemate/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: const TextStyle(color: AppColors.white), // White text
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.darkGrey.withOpacity(0.4),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.white.withOpacity(0.27),
        ),
        // White hint text
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.transparent),
          // No border color when not focused
          borderRadius:
              BorderRadius.circular(13.0), // Optional: Rounded corners
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.transparent),
          // Purple border color when focused
          borderRadius:
              BorderRadius.circular(13.0), // Optional: Rounded corners
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red),
          // Red border color when there's an error
          borderRadius:
              BorderRadius.circular(13.0), // Optional: Rounded corners
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red),
          // Red border color when focused and there's an error
          borderRadius:
              BorderRadius.circular(13.0), // Optional: Rounded corners
        ),
      ),
    );
  }
}
