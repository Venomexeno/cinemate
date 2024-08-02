part of 'payment_cubit.dart';

@immutable
sealed class PaymentState extends Equatable{
  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {}

final class PaymentFailure extends PaymentState {
  final String errMessage;

  PaymentFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
