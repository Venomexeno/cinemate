import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/page_view_next_button.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_custom_stepper.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_page_view.dart';
import 'package:flutter/material.dart';

class TicketPurchasePageBody extends StatefulWidget {
  const TicketPurchasePageBody(
      {super.key,
      required this.movieName,
      required this.movieCoverUrl,
      required this.movieCompany});

  final String movieName;
  final String movieCoverUrl;
  final String movieCompany;

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
            Stack(
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
                    currentPageNotifier: _currentPageNotifier,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 23),
            TicketPurchasePageView(
              movieName: widget.movieName,
              movieCoverUrl: widget.movieCoverUrl,
              movieCompany: widget.movieCompany,
              onPageChanged: (index) {
                _currentPageNotifier.value = index;
              },
              pageController: _pageController,
            ),
            const SizedBox(height: 20),
          ],
        ),
        PageViewNextButton(
            currentPageNotifier: _currentPageNotifier,
            pageController: _pageController),
      ],
    );
  }
}

