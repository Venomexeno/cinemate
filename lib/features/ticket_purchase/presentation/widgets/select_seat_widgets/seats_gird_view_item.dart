import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/available_seat_entity.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/seat_selection_cubit/seat_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatsGirdViewItem extends StatelessWidget {
  const SeatsGirdViewItem({
    super.key,
    required this.seat,
    required this.currentSeatNumber,
  });

  final AvailableSeatEntity seat;
  final int currentSeatNumber;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeatSelectionCubit, List<int>>(
      builder: (context, selectedSeats) {
        final isSelected = selectedSeats.contains(currentSeatNumber);
        return GestureDetector(
          onTap: seat.isAvailable
              ? () {
                context.read<SeatSelectionCubit>().toggleSeatSelection(currentSeatNumber);
              }
              : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: 41,
            width: 41,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.alloyOrange
                  : (seat.isAvailable
                  ? AppColors.white.withOpacity(0.53)
                  : AppColors.darkPurple),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        );
      },
    );
  }
}
