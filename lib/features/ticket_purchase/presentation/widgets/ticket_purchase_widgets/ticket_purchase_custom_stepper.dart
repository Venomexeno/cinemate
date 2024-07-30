import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class TicketPurchaseCustomStepper extends StatelessWidget {
  const TicketPurchaseCustomStepper({
    super.key,
    required this.currentPageNotifier,
  });

  final ValueNotifier<int> currentPageNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentPageNotifier,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 28.0,
                  height: 28.0,
                  decoration: BoxDecoration(
                    color: currentPageNotifier.value >= index
                        ? AppColors.darkPurple
                        : AppColors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: currentPageNotifier.value < index
                          ? AppColors.darkPurple
                          : AppColors.transparent,
                    ),
                  ),
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: currentPageNotifier.value > index
                          ? const Icon(Icons.check_rounded,
                              color: AppColors.white, size: 10)
                          : Text(
                              '${index + 1}',
                              style: AppStyles.medium10.copyWith(
                                color: currentPageNotifier.value >= index
                                    ? AppColors.white
                                    : AppColors.darkPurple,
                              ),
                            ),
                    ),
                  ),
                ),
                if (index != 3)
                  SizedBox(
                    width: 11,
                    child: Divider(
                      color: AppColors.darkPurple.withOpacity(0.5),
                      height: 2,
                    ),
                  ),
              ],
            );
          }),
        );
      },
    );
  }
}
