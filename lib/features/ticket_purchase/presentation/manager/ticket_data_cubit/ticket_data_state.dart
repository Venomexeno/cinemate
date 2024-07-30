import 'package:cinemate/features/ticket_purchase/domain/entities/buffet_product_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/movie_session_entity.dart';
import 'package:equatable/equatable.dart';

class TicketDataState extends Equatable {
  final MovieSessionEntity? movieSession;
  final List<BuffetProductEntity>? buffetProducts;
  final List<String>? seats;

  const TicketDataState({
    this.movieSession,
    this.buffetProducts,
    this.seats,
  });

  @override
  List<Object?> get props => [movieSession, buffetProducts, seats];
}

