import 'package:cinemate/features/tickets/domain/entities/ticket_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TicketModel extends TicketEntity {
  const TicketModel({
    required super.createdAt,
    required super.id,
  });

  factory TicketModel.fromDocument(DocumentSnapshot doc) {
    return TicketModel(
      id: doc.id,
      createdAt: doc['created_at'],
    );
  }
}
