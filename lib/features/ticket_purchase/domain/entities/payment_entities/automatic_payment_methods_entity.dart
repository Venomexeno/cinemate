import 'package:equatable/equatable.dart';

class AutomaticPaymentMethodsEntity extends Equatable{
  final bool? enabled;

  const AutomaticPaymentMethodsEntity({
    this.enabled,
  });

  @override
  List<Object?> get props => [enabled];
}
