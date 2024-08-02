import 'package:cinemate/core/utils/get_visible_seat_number.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/available_seat_entity.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/seat_selection_cubit/seat_selection_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/ticket_data_cubit/ticket_data_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/select_seat_widgets/seats_gird_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatsGirdView extends StatelessWidget {
  const SeatsGirdView({
    super.key,
    required this.seats,
  });

  final List<AvailableSeatEntity> seats;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SeatSelectionCubit, List<int>>(
      listener: (context, selectedSeats) =>
          context.read<TicketDataCubit>().selectSeats(selectedSeats.length),
      child: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            int row = index ~/ 12;
            int column = index % 12;
            final int currentSeatNumber = getVisibleSeatNumber(index);
            // Skip row 5 (indices 60 to 71) and the extra space column (column 9)
            if (row == 4 || column == 9) {
              return const SizedBox.shrink();
            }
            // Counter for visible cells
            final seat = seats.firstWhere(
              (seat) => int.parse(seat.id) == currentSeatNumber,
            ); // Get the seat with the current seat number
            return SeatsGirdViewItem(
              seat: seat,
              currentSeatNumber: currentSeatNumber,
            );
          },
          childCount: 108, // Total 108 items (9 rows * 12 columns)
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 12, // 11 seats + 1 for extra spacing
          mainAxisSpacing: 10.0, // Space between rows
          crossAxisSpacing: 4.0, // Space between columns
        ),
      ),
    );
  }

}
