import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MovieSessionEntity extends Equatable {
  final String id;
  final Timestamp date;

  const MovieSessionEntity({required this.id, required this.date});

  @override
  List<Object> get props => [
        id,
        date,
      ];
}
