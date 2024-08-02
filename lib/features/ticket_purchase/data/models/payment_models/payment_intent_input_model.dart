import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/payment_intent_input_entity.dart';

class PaymentIntentInputModel extends PaymentIntentInputEntity {
  const PaymentIntentInputModel({
    required super.amount,
    required super.customerId,
    required super.currency,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'customer': customerId,
      'currency': currency,
    };
  }
}
