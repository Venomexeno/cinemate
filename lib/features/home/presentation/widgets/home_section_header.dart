import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    this.onTap,
    required this.sectionTitle,
  });

  final void Function()? onTap;
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 4,
            backgroundColor: AppColors.white,
          ),
          const SizedBox(width: 6),
          Text(
            sectionTitle,
            style: AppStyles.light16,
          ),
          const Spacer(),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: Text(
                AppStrings.seeAll,
                style: AppStyles.light11.copyWith(
                  color: AppColors.darkPurple,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.darkPurple,
                  decorationThickness: 2.0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
