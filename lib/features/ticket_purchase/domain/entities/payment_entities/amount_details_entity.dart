import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/metadata_entity.dart';
import 'package:equatable/equatable.dart';

class AmountDetailsEntity extends Equatable {
  final MetadataEntity? tip;

  const AmountDetailsEntity({
    this.tip,
  });

  @override
  List<Object?> get props => [tip];
}