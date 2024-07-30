import 'dart:ui';

import 'package:cinemate/core/constants/app_assets.dart';
import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_icons.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/buffet_product_entity.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/buffet_product_cubit/buffet_product_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_session_selection_widgets/buffet_products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuffetProductsBottomSheet extends StatelessWidget {
  const BuffetProductsBottomSheet({
    super.key,
    required this.onAddProducts,
  });

  final Function(List<BuffetProductEntity>) onAddProducts;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.jetBlack,
            image: DecorationImage(
              image: AssetImage(AppAssets.background),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: const CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(top: 30),
                sliver: SliverToBoxAdapter(
                  child: Icon(
                    AppIcons.popCornIcon,
                    size: 41,
                    color: AppColors.white,
                  ),
                ),
              ),
              SliverPadding(
                padding:
                    EdgeInsets.only(top: 22, left: 21, right: 21, bottom: 104),
                sliver: BuffetProductsListView(),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 19.2,
                sigmaY: 19.2,
              ),
              child: Container(
                height: 104,
                color: AppColors.black.withOpacity(0.21),
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${AppStrings.price}:', style: AppStyles.medium10),
                        const SizedBox(width: 10),
                        BlocBuilder<BuffetProductCubit,
                            List<BuffetProductEntity>>(
                          builder: (context, state) {
                            final totalPrice = state
                                .map((product) =>
                                    product.price * product.quantity)
                                .reduce((value, element) {
                              return value + element;
                            });
                            return Text(
                              '\$$totalPrice',
                              style: AppStyles.semiBold25.copyWith(
                                color: AppColors.limeGreen,
                                shadows: [
                                  const Shadow(
                                    blurRadius: 8.0,
                                    color: AppColors.limeGreen,
                                    offset: Offset(0, 0),
                                  ),
                                  const Shadow(
                                    blurRadius: 8.0,
                                    color: AppColors.limeGreen,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    )),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(double.infinity, 60),
                          backgroundColor: AppColors.darkPurple,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        onPressed: () {
                          final buffetProducts = context
                              .read<BuffetProductCubit>()
                              .getProductsWithNonZeroQuantity();
                          onAddProducts(buffetProducts);
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppStrings.addToCart,
                          style: AppStyles.semiBold14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
