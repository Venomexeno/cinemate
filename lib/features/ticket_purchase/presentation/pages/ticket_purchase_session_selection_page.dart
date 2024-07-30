import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_session_selection_widgets/select_buffet_products_button.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_session_selection_widgets/select_session_button.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_session_selection_widgets/session_selection_movie_data.dart';
import 'package:flutter/material.dart';

class TicketPurchaseSessionSelectionPage extends StatelessWidget {
  const TicketPurchaseSessionSelectionPage({
    super.key,
    required this.movieCoverUrl,
    required this.movieName,
    required this.movieCompany,
    required this.movieId,
  });

  final String movieCoverUrl;
  final String movieName;
  final String movieCompany;
  final String movieId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SessionSelectionMovieData(
            movieCoverUrl: movieCoverUrl,
            movieName: movieName,
            movieCompany: movieCompany,
          ),
          const SizedBox(height: 22),
          Text(
            AppStrings.checkoutMandatoryFieldsMessage,
            style: AppStyles.semiBold13.copyWith(
              color: AppColors.white.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 28),
          SelectSessionButton(movieId: movieId),
          const SizedBox(height: 20),
          const SelectBuffetProductsButton(),
        ],
      ),
    );
  }
}
