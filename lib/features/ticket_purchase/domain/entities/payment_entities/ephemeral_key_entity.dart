import 'package:equatable/equatable.dart';

class EphemeralKeyEntity extends Equatable {
  final String id;
  final String object;
  final int created;
  final int expires;
  final bool livemode;
  final String secret;

  const EphemeralKeyEntity({
    required this.id,
    required this.object,
    required this.created,
    required this.expires,
    required this.livemode,
    required this.secret,
  });

  @override
  List<Object?> get props => [
        id,
        object,
        created,
        expires,
        livemode,
        secret,
      ];
}
