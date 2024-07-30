import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/available_seat_entity.dart';
import 'package:flutter/material.dart';

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
    return Container(
      height: 41,
      width: 41,
      decoration: BoxDecoration(
        color: seat.isAvailable ? AppColors.darkGrey : AppColors.darkPurple,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: Text(
          '$currentSeatNumber',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
