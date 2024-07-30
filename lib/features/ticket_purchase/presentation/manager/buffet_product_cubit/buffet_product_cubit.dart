import 'package:cinemate/features/ticket_purchase/domain/entities/buffet_product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuffetProductCubit extends Cubit<List<BuffetProductEntity>> {
  BuffetProductCubit()
      : super([
          const BuffetProductEntity(
            id: 1,
            name: 'Large Menu',
            popCornSize: 'Large Procorn',
            colaSize: 'Large Coca Cola (400 ml.)',
            price: 30,
            quantity: 0,
          ),
          const BuffetProductEntity(
            id: 2,
            name: 'Medium Menu',
            popCornSize: 'Medium Procorn',
            colaSize: 'Medium Coca Cola (330 ml.)',
            price: 20,
            quantity: 0,
          ),
          const BuffetProductEntity(
            id: 3,
            name: 'Small Menu',
            popCornSize: 'Small Procorn',
            colaSize: 'Small Coca Cola (250 ml.)',
            price: 10,
            quantity: 0,
          ),
        ]);

  void increaseQuantity(int id) {
    final updatedProducts = state.map((product) {
      if (product.id == id) {
        return product.copyWith(quantity: product.quantity + 1);
      }
      return product;
    }).toList();
    emit(updatedProducts);
  }

  void decreaseQuantity(int id) {
    final updatedProducts = state.map((product) {
      if (product.id == id && product.quantity > 0) {
        return product.copyWith(quantity: product.quantity - 1);
      }
      return product;
    }).toList();
    emit(updatedProducts);
  }

  List<BuffetProductEntity> getProductsWithNonZeroQuantity() {
    return state.where((product) => product.quantity > 0).toList();
  }
}
