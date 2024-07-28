import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class MovieDetailsSectionHeader extends StatelessWidget {
  const MovieDetailsSectionHeader({
    super.key, required this.sectionTitle,
  });

  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 4,
          backgroundColor: AppColors.white,
        ),
        const SizedBox(width: 6),
        Text(
          sectionTitle,
          style: AppStyles.semiBold16,
        ),
      ],
    );
  }
}
