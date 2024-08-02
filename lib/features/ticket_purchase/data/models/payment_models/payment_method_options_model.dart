import 'package:cinemate/features/ticket_purchase/data/models/payment_models/card_model.dart';
import 'package:cinemate/features/ticket_purchase/data/models/payment_models/link_model.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/payment_method_options_entity.dart';

class PaymentMethodOptionsModel extends PaymentMethodOptionsEntity {
  const PaymentMethodOptionsModel({
    required super.card,
    required super.link,
  });

  factory PaymentMethodOptionsModel.fromJson(Map<String, dynamic> json) => PaymentMethodOptionsModel(
    card: json["card"] == null ? null : CardModel.fromJson(json["card"]),
    link: json["link"] == null ? null : LinkModel.fromJson(json["link"]),
  );
}
