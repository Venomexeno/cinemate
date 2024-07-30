import 'package:cinemate/features/ticket_purchase/domain/entities/buffet_product_entity.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/ticket_data_cubit/ticket_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketDataCubit extends Cubit<TicketDataState> {
  TicketDataCubit() : super(const TicketDataState());

  void selectSession({
    required String session,
}) {
    emit(TicketDataState(
      session: session,
      buffetProducts: state.buffetProducts,
      seats: state.seats,
    ));
  }

  void selectBuffetProducts({required List<BuffetProductEntity> buffetProducts}) {
    emit(TicketDataState(
      session: state.session,
      buffetProducts: buffetProducts,
      seats: state.seats,
    ));
  }

  void selectSeats(List<String> seats) {
    emit(TicketDataState(
      session: state.session,
      buffetProducts: state.buffetProducts,
      seats: seats,
    ));
  }
}
