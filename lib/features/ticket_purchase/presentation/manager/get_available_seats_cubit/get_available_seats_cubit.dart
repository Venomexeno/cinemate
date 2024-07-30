import 'package:cinemate/features/ticket_purchase/domain/entities/available_seat_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/use_cases/get_available_seats_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_available_seats_state.dart';

class GetAvailableSeatsCubit extends Cubit<GetAvailableSeatsState> {
  GetAvailableSeatsCubit(this._getAvailableSeatsUseCase)
      : super(GetAvailableSeatsInitial());

  final GetAvailableSeatsUseCase _getAvailableSeatsUseCase;

  Future<void> getAvailableSeats(GetAvailableSeatsParameters parameters) async {
    emit(GetAvailableSeatsLoading());
    final result = await _getAvailableSeatsUseCase(parameters);
    result.fold(
      (failure) =>
          emit(GetAvailableSeatsFailure(errMessage: failure.toString())),
      (availableSeats) =>
          emit(GetAvailableSeatsSuccess(availableSeats: availableSeats)),
    );
  }
}
