import 'dart:ui';

import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class PageViewNextButton extends StatelessWidget {
  const PageViewNextButton({
    super.key,
    required this.currentPageNotifier,
    required this.pageController,
  });

  final ValueNotifier<int> currentPageNotifier;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 19.2,
            sigmaY: 19.2,
          ),
          child: Container(
              height: 104,
              color: AppColors.black.withOpacity(0.21),
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 26),
              child: ValueListenableBuilder<int>(
                valueListenable: currentPageNotifier,
                builder: (context, value, child) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 57),
                      backgroundColor: AppColors.darkPurple.withOpacity(0.4),
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    onPressed: () {
                      if (currentPageNotifier.value == 0) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: Text(
                        currentPageNotifier.value == 0
                            ? AppStrings.buyTicketNow
                            : AppStrings.seeAll,
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
                        key: ValueKey<int>(currentPageNotifier.value),
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
