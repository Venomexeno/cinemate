import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/link_entity.dart';

class LinkModel extends LinkEntity {
  const LinkModel({required super.persistentToken});

  factory LinkModel.fromJson(Map<String, dynamic> json) => LinkModel(
        persistentToken: json["persistent_token"],
      );
}
