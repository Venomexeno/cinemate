import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class OrRow extends StatelessWidget {
  const OrRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            height: 1,
            thickness: 2,
            endIndent: 6,
            color: AppColors.white.withOpacity(0.37),
          ),
        ),
        Text(
          AppStrings.or,
          style: AppStyles.regular20.copyWith(
            color: AppColors.white.withOpacity(0.37),
          ),
        ),
        Expanded(
          child: Divider(
            height: 1,
            thickness: 2,
            indent: 6,
            color: AppColors.white.withOpacity(0.37),

          ),
        ),
      ],
    );
  }
}
