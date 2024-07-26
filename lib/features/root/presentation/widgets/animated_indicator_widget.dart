import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/utils/calculate_indicator_left_position.dart';
import 'package:flutter/material.dart';

class AnimatedIndicatorWidget extends StatelessWidget {
  final int index;

  const AnimatedIndicatorWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: -(9 / 2),
      left: calculateIndicatorLeftPosition(context, index),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Container(
        height: 9,
        width: 57,
        decoration: BoxDecoration(
          color: AppColors.darkPurple,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

}
