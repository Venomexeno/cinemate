import 'package:cinemate/features/ticket_purchase/domain/entities/available_seat_entity.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/select_seat_widgets/seats_gird_view_item.dart';
import 'package:flutter/material.dart';

class SeatsGirdView extends StatelessWidget {
  const SeatsGirdView({
    super.key,
    required this.seats,
  });

  final List<AvailableSeatEntity> seats;

  @override
  Widget build(BuildContext context) {
    int currentSeatNumber = 0; // Counter for seat numbers
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          int row = index ~/ 12;
          int column = index % 12;

          // Skip row 5 (indices 60 to 71) and the extra space column (column 9)
          if (row == 4 || column == 9) {
            return const SizedBox.shrink();
          }
          // Counter for visible cells
          final seat = seats.firstWhere(
                (seat) => int.parse(seat.id) == currentSeatNumber + 1,
          ); // Get the seat with the current seat number
          currentSeatNumber++;
          return SeatsGirdViewItem(seat: seat, currentSeatNumber: currentSeatNumber);
        },
        childCount: 108, // Total 108 items (9 rows * 12 columns)
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 12, // 11 seats + 1 for extra spacing
        mainAxisSpacing: 10.0, // Space between rows
        crossAxisSpacing: 4.0, // Space between columns
      ),
    );
  }
}

