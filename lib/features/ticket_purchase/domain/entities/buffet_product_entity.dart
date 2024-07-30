import 'package:equatable/equatable.dart';

class BuffetProductEntity extends Equatable {
  final int id;
  final String name;
  final String popCornSize;
  final String colaSize;
  final int quantity;
  final int price;

  const BuffetProductEntity({
    required this.popCornSize,
    required this.colaSize,
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  BuffetProductEntity copyWith({
    int? id,
    String? popCornSize,
    String? colaSize,
    String? name,
    int? quantity,
    int? price,
  }) {
    return BuffetProductEntity(
      id: id ?? this.id,
      popCornSize: popCornSize ?? this.popCornSize,
      colaSize: colaSize ?? this.colaSize,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  @override
  List<Object> get props => [
        id,
        popCornSize,
        colaSize,
        name,
        quantity,
        price,
      ];
}
