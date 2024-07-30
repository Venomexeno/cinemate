import 'package:cinemate/features/ticket_purchase/domain/entities/buffet_product_entity.dart';
import 'package:equatable/equatable.dart';

class TicketDataState extends Equatable {
  final String? session;
  final List<BuffetProductEntity>? buffetProducts;
  final List<String>? seats;

  const TicketDataState({
    this.session,
    this.buffetProducts,
    this.seats,
  });

  @override
  List<Object?> get props => [session, buffetProducts, seats];
}

