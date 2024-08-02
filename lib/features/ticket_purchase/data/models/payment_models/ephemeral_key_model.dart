import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/ephemeral_key_entity.dart';

class EphemeralKeyModel extends EphemeralKeyEntity {

  const EphemeralKeyModel({
    required super.created,
    required super.expires,
    required super.id,
    required super.livemode,
    required super.object,
    required super.secret,
  });

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) {
    return EphemeralKeyModel(
      created: json['created'],
      expires: json['expires'],
      id: json['id'],
      livemode: json['livemode'],
      object: json['object'],
      secret: json['secret'],
    );
  }
}
