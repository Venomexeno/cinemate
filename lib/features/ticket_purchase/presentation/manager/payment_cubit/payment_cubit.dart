import 'dart:developer';

import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/payment_intent_input_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/use_cases/make_payment_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._makePaymentUseCase) : super(PaymentInitial());

  final MakePaymentUseCase _makePaymentUseCase;

  Future makePayment(
      {required PaymentIntentInputEntity paymentIntentInputEntity}) async {
    emit(PaymentLoading());
    final result = await _makePaymentUseCase(paymentIntentInputEntity);
    result.fold(
      (failure) => emit(PaymentFailure(errMessage: failure.message)),
      (success) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
