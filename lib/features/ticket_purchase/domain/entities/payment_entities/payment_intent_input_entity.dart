import 'package:equatable/equatable.dart';

class PaymentIntentInputEntity extends Equatable {
  final String amount;
  final String currency;
  final String customerId;

  const PaymentIntentInputEntity({
    required this.amount,
    required this.currency,
    required this.customerId,
  });

  @override
  List<Object?> get props => [amount, currency, customerId];
}
