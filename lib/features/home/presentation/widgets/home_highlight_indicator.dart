import 'package:cinemate/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeHighlightIndicator extends StatelessWidget {
  const HomeHighlightIndicator({
    super.key,
    required this.indicatorLength,
    required this.currentPageNotifier,
  });

  final ValueNotifier<int> currentPageNotifier;
  final int indicatorLength;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentPageNotifier,
      builder: (context, currentPage, child) {
        return AnimatedSmoothIndicator(
          activeIndex: currentPage,
          count: indicatorLength,
          effect: ExpandingDotsEffect(
            dotWidth: 7,
            dotHeight: 7,
            expansionFactor: 2.5,
            activeDotColor: AppColors.darkPurple,
            dotColor: AppColors.silver.withOpacity(0.55),
          ),
        );
      },
    );
  }
}
