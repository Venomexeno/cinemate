import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/core/use_cases/no_param_use_case.dart';
import 'package:cinemate/features/tickets/domain/entities/ticket_entity.dart';
import 'package:cinemate/features/tickets/domain/repositories/tickets_repo.dart';
import 'package:dartz/dartz.dart';

class GetTicketsUseCase extends UseCase<List<TicketEntity>> {
  final TicketsRepo _ticketsRepo;

  GetTicketsUseCase(this._ticketsRepo);

  @override
  Future<Either<Failure, List<TicketEntity>>> call() async {
    return await _ticketsRepo.getTickets();
  }
}
