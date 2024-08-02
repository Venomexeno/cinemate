import 'package:flutter_bloc/flutter_bloc.dart';

class SeatSelectionCubit extends Cubit<List<int>> {
  SeatSelectionCubit() : super([]);

  void toggleSeatSelection(int seatNumber) {
    List<int> updatedSeats = List.from(state);
    if (updatedSeats.contains(seatNumber)) {
      updatedSeats.remove(seatNumber);
    } else {
      updatedSeats.add(seatNumber);
    }
    emit(updatedSeats);
  }
}
