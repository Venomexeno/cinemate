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
      seatsCount: state.seatsCount,
      paymentMethod: state.paymentMethod,
    ));
  }

  void selectBuffetProducts(
      {required List<BuffetProductEntity> buffetProducts}) {
    emit(TicketDataState(
      movieSession: state.movieSession,
      buffetProducts: buffetProducts,
      seatsCount: state.seatsCount,
      paymentMethod: state.paymentMethod,

    ));
  }

  void selectSeats(int seatsCount) {
    emit(TicketDataState(
      movieSession: state.movieSession,
      buffetProducts: state.buffetProducts,
      seatsCount: seatsCount,
      paymentMethod: state.paymentMethod,
    ));
  }
  void selectPaymentMethod(String? paymentMethod) {
    emit(TicketDataState(
      movieSession: state.movieSession,
      buffetProducts: state.buffetProducts,
      seatsCount: state.seatsCount,
      paymentMethod: paymentMethod,
    ));
  }

}
