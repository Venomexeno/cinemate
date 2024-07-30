import 'package:cinemate/features/ticket_purchase/domain/entities/buffet_product_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/movie_session_entity.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/ticket_data_cubit/ticket_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketDataCubit extends Cubit<TicketDataState> {
  TicketDataCubit() : super(const TicketDataState());

  void selectSession({
    required MovieSessionEntity movieSession,
}) {
    emit(TicketDataState(
      movieSession: movieSession,
      buffetProducts: state.buffetProducts,
      seats: state.seats,
    ));
  }

  void selectBuffetProducts({required List<BuffetProductEntity> buffetProducts}) {
    emit(TicketDataState(
      movieSession: state.movieSession,
      buffetProducts: buffetProducts,
      seats: state.seats,
    ));
  }

  void selectSeats(List<String> seats) {
    emit(TicketDataState(
      movieSession: state.movieSession,
      buffetProducts: state.buffetProducts,
      seats: seats,
    ));
  }
}
