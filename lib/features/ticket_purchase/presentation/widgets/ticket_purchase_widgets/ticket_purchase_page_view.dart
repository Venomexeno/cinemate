import 'package:cinemate/features/ticket_purchase/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/pages/payment_method_page.dart';
import 'package:cinemate/features/ticket_purchase/presentation/pages/payment_status_page.dart';
import 'package:cinemate/features/ticket_purchase/presentation/pages/select_seat_page.dart';
import 'package:cinemate/features/ticket_purchase/presentation/pages/ticket_purchase_session_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketPurchasePageView extends StatelessWidget {
  const TicketPurchasePageView({
    super.key,
    required this.movieName,
    required this.movieCoverUrl,
    required this.movieCompany,
    required this.onPageChanged,
    required this.pageController,
    required this.movieId,
  });

  final String movieName;
  final String movieId;
  final String movieCoverUrl;
  final String movieCompany;
  final Function(int) onPageChanged;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: [
            TicketPurchaseSessionSelectionPage(
              movieId: movieId,
              movieCoverUrl: movieCoverUrl,
              movieName: movieName,
              movieCompany: movieCompany,
            ),
            SelectSeatPage(
              movieName: movieName,
            ),
            const PaymentMethodPage(),
            const PaymentStatusPage(
            ),
          ],
        ),
      ),
    );
  }
}
