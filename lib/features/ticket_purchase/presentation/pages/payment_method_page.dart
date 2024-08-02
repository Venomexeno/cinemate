import 'package:cinemate/features/ticket_purchase/presentation/manager/payment_method_cubit/payment_method_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/ticket_data_cubit/ticket_data_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/payment_method_widgets/payment_method_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_assets.dart';
import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_styles.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentMethodCubit, int>(
      listener: (context, selectedIndex) {
        if (selectedIndex == 0) {
          context.read<TicketDataCubit>().selectPaymentMethod(
                'Card',
              );
        } else {
          context.read<TicketDataCubit>().selectPaymentMethod(
                null,
              );
        }
      },
      builder: (context, selectedIndex) {
        final cubit = context.read<PaymentMethodCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.selectPaymentOptions,
              style: AppStyles.semiBold16.copyWith(
                color: AppColors.white.withOpacity(0.52),
              ),
            ),
            const SizedBox(height: 15),
            PaymentMethodContainer(
              isSelected: selectedIndex == 0,
              text: 'Pay with Credit/Debit Card',
              assetPath: AppAssets.card,
              onTap: () => cubit.selectPaymentMethod(0),
            ),
          ],
        );
      },
    );
  }
}
