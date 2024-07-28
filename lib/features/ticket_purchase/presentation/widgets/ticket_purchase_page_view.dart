import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_session_selection.dart';
import 'package:flutter/material.dart';

class TicketPurchasePageView extends StatelessWidget {
  const TicketPurchasePageView({
    super.key,
    required this.movieName,
    required this.movieCoverUrl,
    required this.movieCompany,
    required this.onPageChanged,
    required this.pageController,
  });

  final String movieName;
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
          controller: pageController,
          onPageChanged: onPageChanged,
          children: [
            TicketPurchaseSessionSelection(
              movieCoverUrl: movieCoverUrl,
              movieName: movieName,
              movieCompany: movieCompany,
            ),
            const SizedBox(),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
