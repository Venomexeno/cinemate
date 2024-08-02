import 'package:cinemate/features/ticket_purchase/data/models/payment_models/metadata_model.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/amount_details_entity.dart';

class AmountDetailsModel extends AmountDetailsEntity {
  const AmountDetailsModel({
    required super.tip,
  });

  factory AmountDetailsModel.fromJson(Map<String, dynamic> json) => AmountDetailsModel(
    tip: json["tip"] == null ? null : MetadataModel.fromJson(json["tip"]),
  );
}