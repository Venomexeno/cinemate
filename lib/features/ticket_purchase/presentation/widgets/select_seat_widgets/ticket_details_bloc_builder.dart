import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/core/utils/format_seat_number.dart';
import 'package:cinemate/core/utils/format_timestamp.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/seat_selection_cubit/seat_selection_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/ticket_data_cubit/ticket_data_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/ticket_data_cubit/ticket_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketDetailsBlocBuilder extends StatelessWidget {
  const TicketDetailsBlocBuilder({
    super.key,
    required this.movieName,
  });

  final String movieName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketDataCubit, TicketDataState>(
      builder: (context, state) {
        final movieSession = state.movieSession!.date;
        final totalBuffetQuantity = state.buffetProducts == null
            ? 'None'
            : (state.buffetProducts
            ?.map((product) => product.quantity)
            .reduce((value, element) => value + element))
            .toString(); // Calculate the total quantity of Buffet Products
        final totalBuffetPrice = state.buffetProducts == null
            ? '0'
            : (state.buffetProducts!
            .map((product) => product.price * product.quantity)
            .reduce((value, element) => value + element)).toString();
        return IntrinsicHeight(
          child: Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: AppColors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Movie: $movieName',
                        style: AppStyles.semiBold10.copyWith(
                          color: AppColors.white.withOpacity(0.37),
                        ),
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<SeatSelectionCubit, List<int>>(
                        builder: (context, selectedSeats) {
                          return RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                  'Ticket Count: ${selectedSeats.length} ',
                                  style: AppStyles.semiBold10,
                                ),
                                TextSpan(
                                  text: '(\$${selectedSeats.length * 20})',
                                  style: AppStyles.semiBold10
                                      .copyWith(color: AppColors.limeGreen),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Session: ${formatTimeFromTimestamp(movieSession)}',
                        style: AppStyles.semiBold10.copyWith(
                          color: AppColors.white.withOpacity(0.37),
                        ),
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<SeatSelectionCubit, List<int>>(
                        builder: (context, selectedSeats) {
                          final formattedSeats = selectedSeats
                              .map((seatNumber) => formatSeatNumber(seatNumber))
                              .toList();
                          return Text(
                            'Seat Number: ${formattedSeats.join(', ')}',
                            style: AppStyles.semiBold10,
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Buffet Products: $totalBuffetQuantity (\$$totalBuffetPrice)',
                        style: AppStyles.semiBold10.copyWith(
                          color: AppColors.white.withOpacity(0.37),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      20, // Number of dashed lines you want
                          (index) =>
                          Container(
                            width: 1,
                            height: 1,
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            color: AppColors.white,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        AppStrings.totalAmount,
                        style: AppStyles.semiBold10.copyWith(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          decorationColor: AppColors.white,
                        ),
                      ),
                      const Spacer(),
                      BlocBuilder<SeatSelectionCubit, List<int>>(
                        builder: (context, selectedSeats) {
                          final totalAmount = '${(selectedSeats.length * 20) + int.parse(totalBuffetPrice)}';
                          return Text(
                            '\$$totalAmount',
                            style: AppStyles.semiBold25
                                .copyWith(color: AppColors.limeGreen),
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
