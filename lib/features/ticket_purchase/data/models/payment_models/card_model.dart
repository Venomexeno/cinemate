import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/card_entity.dart';

class CardModel extends CardEntity{
  const CardModel({
    required super.installments,
    required super.mandateOptions,
    required super.network,
    required super.requestThreeDSecure,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
    installments: json["installments"],
    mandateOptions: json["mandate_options"],
    network: json["network"],
    requestThreeDSecure: json["request_three_d_secure"],
  );
}
