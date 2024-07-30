import 'package:cinemate/core/constants/app_assets.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class SelectSeatPage extends StatelessWidget {
  const SelectSeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppStrings.screen, style: AppStyles.semiBold20),
        const SizedBox(height: 5),
        Image.asset(
          AppAssets.screen,
          width: double.infinity,
        ),
      ],
    );
  }
}
