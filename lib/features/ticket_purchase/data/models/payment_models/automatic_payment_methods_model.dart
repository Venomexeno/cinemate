import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/automatic_payment_methods_entity.dart';

class AutomaticPaymentMethodsModel extends AutomaticPaymentMethodsEntity {
  const AutomaticPaymentMethodsModel({
    required super.enabled,
  });

  factory AutomaticPaymentMethodsModel.fromJson(Map<String, dynamic> json) => AutomaticPaymentMethodsModel(
    enabled: json["enabled"],
  );
}