import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_widgets/ticket_purchase_custom_stepper.dart';
import 'package:flutter/material.dart';

class TicketPurchaseBackAndStepper extends StatelessWidget {
  const TicketPurchaseBackAndStepper({
    super.key,
    required this.currentPageNotifier,
  });

  final ValueNotifier<int> currentPageNotifier;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 21, top: 36),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.darkPurple,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: TicketPurchaseCustomStepper(
            currentPageNotifier: currentPageNotifier,
          ),
        ),
      ],
    );
  }
}
