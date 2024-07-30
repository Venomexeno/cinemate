import 'package:cinemate/features/ticket_purchase/domain/entities/buffet_product_entity.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/buffet_product_cubit/buffet_product_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_session_selection_widgets/buffet_products_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuffetProductsListView extends StatelessWidget {
  const BuffetProductsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuffetProductCubit, List<BuffetProductEntity>>(
      builder: (context, buffetProducts) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: buffetProducts.length,
                (context, index) {
              final buffetProduct = buffetProducts[index];
              return Padding(
                padding:  EdgeInsets.only(bottom: buffetProducts.length - 1 == index ? 0 : 18),
                child: BuffetProductsListViewItem(
                  onDecrease: (){
                    context.read<BuffetProductCubit>().decreaseQuantity(buffetProduct.id);
                  },
                  onIncrease: (){
                    context.read<BuffetProductCubit>().increaseQuantity(buffetProduct.id);

                  },
                  buffetProduct: buffetProduct,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
