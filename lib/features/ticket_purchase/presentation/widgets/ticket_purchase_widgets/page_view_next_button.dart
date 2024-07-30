import 'dart:ui';

import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/ticket_data_cubit/ticket_data_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/ticket_data_cubit/ticket_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewNextButton extends StatelessWidget {
  const PageViewNextButton({
    super.key,
    required this.pageController,
    required this.currentPage,
  });

  final PageController pageController;
  final int currentPage;

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
            child: BlocBuilder<TicketDataCubit, TicketDataState>(
              builder: (context, state) {
                bool isButtonEnabled = false;
                if (currentPage == 0 && state.session != null) {
                  isButtonEnabled = true;
                } else if (currentPage == 1 && state.seats != null) {
                  isButtonEnabled = true;
                }
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor:
                        AppColors.darkPurple.withOpacity(0.25),
                    disabledForegroundColor: AppColors.white.withOpacity(0.25),
                    fixedSize: Size(MediaQuery.of(context).size.width, 57),
                    backgroundColor: AppColors.darkPurple.withOpacity(0.4),
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onPressed: isButtonEnabled
                      ? () {
                          if (currentPage < 3) {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      : null,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Text(
                      currentPage == 0
                          ? AppStrings.next
                          : currentPage == 1
                              ? AppStrings.paymentOptions
                              : AppStrings.buyTicketNow,
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
                      key: ValueKey<int>(currentPage),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
