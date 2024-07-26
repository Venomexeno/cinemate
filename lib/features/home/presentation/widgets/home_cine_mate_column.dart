import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class HomeCineMateColumn extends StatelessWidget {
  const HomeCineMateColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 1,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
            )),
        Text(
          AppStrings.cine,
          style: AppStyles.semiBold15,
        ),
        Text(
          AppStrings.mate,
          style: AppStyles.semiBold15,
        ),
        Container(
          height: 1,
          width: 60,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ],
    );
  }
}
