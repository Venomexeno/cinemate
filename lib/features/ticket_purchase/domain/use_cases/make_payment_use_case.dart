import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/core/use_cases/use_case.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/payment_intent_input_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/repositories/ticket_purchase_repo.dart';
import 'package:dartz/dartz.dart';

class MakePaymentUseCase extends UseCase<void, PaymentIntentInputEntity> {
  final TicketPurchaseRepo _ticketPurchaseRepo;

  MakePaymentUseCase(this._ticketPurchaseRepo);

  @override
  Future<Either<Failure, void>> call(
      PaymentIntentInputEntity parameters) async {
    return await _ticketPurchaseRepo.makePayment(
        paymentIntentInputEntity: parameters);
  }
}
