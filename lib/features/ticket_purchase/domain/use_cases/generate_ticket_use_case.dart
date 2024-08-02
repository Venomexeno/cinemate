import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/core/use_cases/use_case.dart';
import 'package:cinemate/features/ticket_purchase/domain/repositories/ticket_purchase_repo.dart';
import 'package:dartz/dartz.dart';

class GenerateTicketUseCase extends UseCase<void, String> {
  final TicketPurchaseRepo _ticketPurchaseRepo;

  GenerateTicketUseCase(this._ticketPurchaseRepo);

  @override
  Future<Either<Failure, void>> call(String parameters) async {
    return await _ticketPurchaseRepo.generateTicket(ticketId: parameters);
  }
}
