import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_widgets/page_view_next_button.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_widgets/ticket_purchase_back_and_stepper.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_widgets/ticket_purchase_page_view.dart';
import 'package:flutter/material.dart';

class TicketPurchasePageBody extends StatefulWidget {
  const TicketPurchasePageBody(
      {super.key,
      required this.movieName,
      required this.movieCoverUrl,
      required this.movieCompany,
      required this.movieId});

  final String movieName;
  final String movieCoverUrl;
  final String movieCompany;
  final String movieId;

  @override
  State<TicketPurchasePageBody> createState() => _TicketPurchasePageBodyState();
}

class _TicketPurchasePageBodyState extends State<TicketPurchasePageBody> {
  late final PageController _pageController;
  late final ValueNotifier<int> _currentPageNotifier;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentPageNotifier = ValueNotifier(0);
  }

  @override
  dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            TicketPurchaseBackAndStepper(
                currentPageNotifier: _currentPageNotifier),
            const SizedBox(height: 23),
            TicketPurchasePageView(
              movieId: widget.movieId,
              movieName: widget.movieName,
              movieCoverUrl: widget.movieCoverUrl,
              movieCompany: widget.movieCompany,
              onPageChanged: (index) {
                _currentPageNotifier.value = index;
              },
              pageController: _pageController,
            ),
            const SizedBox(height: 104), // Next button height
          ],
        ),
        ValueListenableBuilder(
          valueListenable: _currentPageNotifier,
          builder: (context, value, child) {
            return PageViewNextButton(
              movieId: widget.movieId,
              currentPage: _currentPageNotifier.value,
              pageController: _pageController,
            );
          },
        ),
      ],
    );
  }
}
