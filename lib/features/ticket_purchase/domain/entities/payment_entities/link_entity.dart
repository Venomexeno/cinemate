import 'package:equatable/equatable.dart';

class LinkEntity extends Equatable {
  final dynamic persistentToken;

  const LinkEntity({this.persistentToken});

  @override
  List<Object?> get props => [persistentToken];
}
