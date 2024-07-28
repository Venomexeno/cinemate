import 'package:cinemate/core/widgets/custom_scaffold_with_background.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_page_body.dart';
import 'package:flutter/material.dart';

class TicketPurchasePage extends StatelessWidget {
  const TicketPurchasePage({
    super.key,
    required this.movieData,
  });

  final Map<String, dynamic> movieData;

  @override
  Widget build(BuildContext context) {
    return  CustomScaffoldWithBackground(
      body: TicketPurchasePageBody(
        movieName: movieData['movieTitle'],
        movieCoverUrl: movieData['movieCover'],
        movieCompany: movieData['movieCompany'],
      ),
    );
  }
}
