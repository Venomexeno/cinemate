import 'package:cinemate/features/ticket_purchase/domain/use_cases/generate_ticket_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'generate_ticket_state.dart';

class GenerateTicketCubit extends Cubit<GenerateTicketState> {
  GenerateTicketCubit(this._generateTicketUseCase)
      : super(GenerateTicketInitial());

  final GenerateTicketUseCase _generateTicketUseCase;

  Future<void> generateTicket(String ticketId) async {
    emit(GenerateTicketLoading());
    final result = await _generateTicketUseCase(ticketId);
    result.fold(
      (failure) => emit(GenerateTicketFailure(errMessage: failure.message)),
      (_) => emit(GenerateTicketSuccess()),
    );
  }
}
