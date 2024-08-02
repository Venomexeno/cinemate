import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/card_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/link_entity.dart';
import 'package:equatable/equatable.dart';

class PaymentMethodOptionsEntity extends Equatable{
  final CardEntity? card;
  final LinkEntity? link;

  const PaymentMethodOptionsEntity({
    this.card,
    this.link,
  });
  @override
  List<Object?> get props => [card, link];
}