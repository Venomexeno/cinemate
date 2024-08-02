import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  final dynamic installments;
  final dynamic mandateOptions;
  final dynamic network;
  final String? requestThreeDSecure;

  const CardEntity({
    this.installments,
    this.mandateOptions,
    this.network,
    this.requestThreeDSecure,
  });

  @override
  List<Object?> get props => [
        installments,
        mandateOptions,
        network,
        requestThreeDSecure,
      ];
}
