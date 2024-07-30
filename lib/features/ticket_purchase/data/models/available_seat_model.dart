import 'package:cinemate/features/ticket_purchase/domain/entities/available_seat_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AvailableSeatModel extends AvailableSeatEntity {
  const AvailableSeatModel({
    required super.id,
    required super.isAvailable,
  });

  factory AvailableSeatModel.fromDocument(DocumentSnapshot doc) {
    return AvailableSeatModel(
      id: doc.id,
      isAvailable: doc['isAvailable'],
    );
  }
}
