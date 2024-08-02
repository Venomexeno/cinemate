import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TicketEntity extends Equatable {
  final String id;
  final Timestamp createdAt;

  const TicketEntity({required this.id, required this.createdAt});

  @override
  List<Object?> get props => [
        id,
        createdAt,
      ];
}
