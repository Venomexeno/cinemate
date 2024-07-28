import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/session_selection_movie_data.dart';
import 'package:flutter/material.dart';

class TicketPurchaseSessionSelection extends StatelessWidget {
  const TicketPurchaseSessionSelection({
    super.key,
    required this.movieCoverUrl,
    required this.movieName,
    required this.movieCompany,
  });

  final String movieCoverUrl;
  final String movieName;
  final String movieCompany;

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
          SizedBox(
            width: double.infinity,
            height: 67,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.transparent,
                padding: const EdgeInsets.only(left: 43,right: 26),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: AppColors.darkPurple,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              onPressed: () {},
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.selectSession,
                    style: AppStyles.semiBold20.copyWith(
                      color: AppColors.darkPurple,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.darkPurple,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 67,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.transparent,
                padding: const EdgeInsets.only(left: 43,right: 26),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: AppColors.darkPurple,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              onPressed: () {},
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.buffetProducts,
                    style: AppStyles.semiBold20.copyWith(
                      color: AppColors.darkPurple,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.darkPurple,
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
