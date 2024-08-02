import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_styles.dart';

class PaymentMethodContainer extends StatelessWidget {
  final bool isSelected;
  final String text;
  final String assetPath;
  final VoidCallback onTap;

  const PaymentMethodContainer({
    super.key,
    required this.isSelected,
    required this.text,
    required this.assetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(
                  color: AppColors.white.withOpacity(0.52),
                )
              : null,
          borderRadius: BorderRadius.circular(13),
          color: AppColors.black,
          gradient: isSelected
              ? null
              : const LinearGradient(
                  stops: [0, 1],
                  colors: [Color(0xFFED0006), Color(0xFFF9A000)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2,
              sigmaY: 2,
            ),
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: AppStyles.medium14,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 94,
                    height: 94,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: AppColors.white,
                    ),
                    child: Image.asset(
                      assetPath,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
