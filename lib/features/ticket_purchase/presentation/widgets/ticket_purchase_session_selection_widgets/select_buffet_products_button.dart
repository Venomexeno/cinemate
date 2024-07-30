import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/core/services/service_locator.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/buffet_product_cubit/buffet_product_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/ticket_data_cubit/ticket_data_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_session_selection_widgets/buffet_products_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectBuffetProductsButton extends StatefulWidget {
  const SelectBuffetProductsButton({
    super.key,
  });

  @override
  State<SelectBuffetProductsButton> createState() =>
      _SelectBuffetProductsButtonState();
}

class _SelectBuffetProductsButtonState
    extends State<SelectBuffetProductsButton> {
  late final ValueNotifier<String> _buffetNotifier;

  @override
  void initState() {
    super.initState();
    _buffetNotifier = ValueNotifier<String>(AppStrings.buffetProducts);
  }

  @override
  void dispose() {
    _buffetNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _buffetNotifier,
      builder: (context, value, child) {
        final bool buffetProductSelected = value != AppStrings.buffetProducts;
        return SizedBox(
          width: double.infinity,
          height: 67,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: buffetProductSelected
                  ? AppColors.darkPurple
                  : AppColors.transparent,
              padding: const EdgeInsets.only(left: 43, right: 26),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.darkPurple,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return BlocProvider<BuffetProductCubit>(
                    create: (context) => sl<BuffetProductCubit>(),
                    child: BuffetProductsBottomSheet(
                      onAddProducts: (buffetProducts) {
                        if (buffetProducts.isNotEmpty) {
                          context.read<TicketDataCubit>().selectBuffetProducts(
                              buffetProducts:
                                  buffetProducts); // Add Buffet Products to the TicketDataCubit

                          final totalBuffetQuantity = buffetProducts
                              .map((product) => product.quantity)
                              .reduce((value, element) =>
                                  value +
                                  element); // Calculate the total quantity of Buffet Products

                          _buffetNotifier.value =
                              '$totalBuffetQuantity x Buffet'; // Update the Buffet Button Text
                        } else {
                          _buffetNotifier.value = AppStrings.buffetProducts;
                        }
                      },
                    ),
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: AppStyles.semiBold20.copyWith(
                    color: buffetProductSelected
                        ? AppColors.white
                        : AppColors.darkPurple,
                  ),
                ),
                if (!buffetProductSelected)
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.darkPurple,
                  ), // To Remove the Icon when the Buffet is selected
              ],
            ),
          ),
        );
      },
    );
  }
}
