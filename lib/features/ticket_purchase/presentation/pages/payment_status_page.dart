import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_routes.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentStatusPage extends StatelessWidget {
  const PaymentStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, paymentState) {
        return Column(
          children: [
            const Spacer(),
            _buildIcon(paymentState),
            const SizedBox(height: 27),
            _buildTitle(paymentState),
            const SizedBox(height: 8),
            _buildMessage(paymentState),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.rootPageRoute,
                  (route) => false,
                );
              },
              child: const Text('Back to Home'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildIcon(PaymentState paymentState) {
    if (paymentState is PaymentSuccess) {
      return const Icon(Icons.check_circle, color: AppColors.white, size: 150);
    } else if (paymentState is PaymentFailure) {
      return const Icon(Icons.error, color: AppColors.white, size: 150);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildTitle(PaymentState paymentState) {
    if (paymentState is PaymentSuccess) {
      return Text(
        'Payment Successful',
        style: AppStyles.medium24,
        textAlign: TextAlign.center,
      );
    } else if (paymentState is PaymentFailure) {
      return Text(
        'Payment Failed',
        style: AppStyles.medium24,
        textAlign: TextAlign.center,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildMessage(PaymentState paymentState) {
    if (paymentState is PaymentSuccess) {
      return Text(
        'You can check your ticket in the My Tickets section on the homepage.',
        style: AppStyles.medium12,
        textAlign: TextAlign.center,
      );
    } else if (paymentState is PaymentFailure) {
      return Text(
        'Your ticket purchase could not be processed because there was a problem with the payment process. Try to buy a ticket again.',
        style: AppStyles.medium12,
        textAlign: TextAlign.center,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
