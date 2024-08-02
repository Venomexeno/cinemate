import 'package:cinemate/features/tickets/domain/entities/ticket_entity.dart';
import 'package:cinemate/features/tickets/domain/use_cases/get_tickets_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_tickets_state.dart';

class GetTicketsCubit extends Cubit<GetTicketsState> {
  GetTicketsCubit(this._getTicketsUseCase) : super(GetTicketsInitial());

  final GetTicketsUseCase _getTicketsUseCase;

  Future<void> getTickets() async {
    emit(GetTicketsLoading());
    final result = await _getTicketsUseCase();
    result.fold(
      (failure) => emit(GetTicketsFailure(errMessage: failure.message)),
      (tickets) => emit(GetTicketsSuccess(tickets: tickets)),
    );
  }
}
