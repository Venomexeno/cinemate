import 'package:equatable/equatable.dart';

class InitPaymentSheetInputEntity extends Equatable {
  final String clientSecret;
  final String ephemeralKeySecret;
  final String customerId;

  const InitPaymentSheetInputEntity({
    required this.clientSecret,
    required this.ephemeralKeySecret,
    required this.customerId,
  });

  @override
  List<Object?> get props => [clientSecret, ephemeralKeySecret, customerId];
}
