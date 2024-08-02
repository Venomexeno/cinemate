import 'dart:ui';
import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_keys.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/core/services/service_locator.dart';
import 'package:cinemate/core/utils/generate_random_string.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/payment_intent_input_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/use_cases/get_available_seats_use_case.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/generate_ticket_cubit/generate_ticket_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/get_available_seats_cubit/get_available_seats_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/ticket_data_cubit/ticket_data_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/ticket_data_cubit/ticket_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PageViewNextButton extends StatelessWidget {
  const PageViewNextButton({
    super.key,
    required this.pageController,
    required this.currentPage,
    required this.movieId,
  });

  final PageController pageController;
  final int currentPage;
  final String movieId;

  @override
  Widget build(BuildContext context) {
    return currentPage == 3 // Hide it on the third page
        ? const SizedBox.shrink()
        : Align(
      alignment: FractionalOffset.bottomCenter,
      child: _buildBlurredContainer(
        child: BlocListener<PaymentCubit, PaymentState>(
          listener: (context, state) async {
            if (state is PaymentSuccess) {
              final ticketId = generateRandomString();
              await context.read<GenerateTicketCubit>().generateTicket(ticketId);
              pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            }
          },
          child: BlocBuilder<TicketDataCubit, TicketDataState>(
            builder: (context, state) {
              final isButtonEnabled = _isButtonEnabled(currentPage, state);
              return _buildElevatedButton(
                context,
                isButtonEnabled,
                    () => _handleButtonPress(context, state),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBlurredContainer({required Widget child}) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 19.2, sigmaY: 19.2),
        child: Container(
          height: 104,
          color: AppColors.black.withOpacity(0.21),
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 26),
          child: child,
        ),
      ),
    );
  }

  bool _isButtonEnabled(int currentPage, TicketDataState state) {
    if (currentPage == 0) {
      return state.movieSession != null;
    } else if (currentPage == 1) {
      return state.seatsCount != null && state.seatsCount! > 0;
    } else if (currentPage == 2) {
      return state.paymentMethod != null;
    }
    return false;
  }

  Widget _buildElevatedButton(
      BuildContext context, bool isButtonEnabled, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppColors.darkPurple.withOpacity(0.25),
        disabledForegroundColor: AppColors.white.withOpacity(0.25),
        fixedSize: Size(MediaQuery.of(context).size.width, 57),
        backgroundColor: AppColors.darkPurple.withOpacity(0.4),
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      onPressed: isButtonEnabled ? onPressed : null,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: Text(
          _getButtonText(currentPage),
          style: AppStyles.medium20.copyWith(
            shadows: [
              const Shadow(blurRadius: 3.0, color: AppColors.white, offset: Offset(0, 0)),
              const Shadow(blurRadius: 8.0, color: AppColors.white, offset: Offset(0, 0)),
            ],
          ),
          key: ValueKey<int>(currentPage),
        ),
      ),
    );
  }

  String _getButtonText(int currentPage) {
    if (currentPage == 0) return AppStrings.next;
    if (currentPage == 1) return AppStrings.paymentOptions;
    return AppStrings.buyTicketNow;
  }

  Future<void> _handleButtonPress(BuildContext context, TicketDataState state) async {
    if (currentPage < 2) {
      if (currentPage == 0) {
        context.read<GetAvailableSeatsCubit>().getAvailableSeats(
          GetAvailableSeatsParameters(
            movieId: movieId,
            movieSessionId: state.movieSession!.id,
          ),
        );
      }
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else if (currentPage == 2) {
      final buffetPrice = state.buffetProducts?.fold(0, (sum, product) => sum + product.price * product.quantity) ?? 0;
      final ticketPrice = state.seatsCount! * 20;
      final totalPrice = buffetPrice + ticketPrice;
      final paymentMethod = state.paymentMethod!;
      if (paymentMethod == 'Card') {
        final customerId = await sl<FlutterSecureStorage>().read(key: AppKeys.kCustomerToken);
        if (context.mounted) {
          context.read<PaymentCubit>().makePayment(
            paymentIntentInputEntity: PaymentIntentInputEntity(
              customerId: customerId!,
              amount: '${totalPrice * 100}',
              currency: 'USD',
            ),
          );
        }
      }
    } else {
      Navigator.pop(context);
    }
  }
}
