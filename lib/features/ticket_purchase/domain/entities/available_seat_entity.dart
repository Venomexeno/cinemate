import 'package:equatable/equatable.dart';

class AvailableSeatEntity extends Equatable {
  final String id;
  final bool isAvailable;

  const AvailableSeatEntity({required this.id, required this.isAvailable});

  @override
  List<Object> get props => [
        id,
        isAvailable,
      ];
}
