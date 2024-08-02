import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/init_payment_sheet_input_entity.dart';

class InitPaymentSheetInputModel extends InitPaymentSheetInputEntity {
  const InitPaymentSheetInputModel({
    required super.clientSecret,
    required super.ephemeralKeySecret,
    required super.customerId,
  });

}
