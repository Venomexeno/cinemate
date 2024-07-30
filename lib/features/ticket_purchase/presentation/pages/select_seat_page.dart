import 'package:cinemate/core/constants/app_assets.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/get_available_seats_cubit/get_available_seats_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/select_seat_widgets/seats_gird_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectSeatPage extends StatelessWidget {
  const SelectSeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAvailableSeatsCubit, GetAvailableSeatsState>(
      builder: (context, state) {
        if (state is GetAvailableSeatsSuccess) {
          final seats = state.availableSeats;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text(AppStrings.screen, style: AppStyles.semiBold20),
                    const SizedBox(height: 5),
                    Image.asset(
                      AppAssets.screen,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              SeatsGirdView(seats: seats)
            ],
          );
        } else if (state is GetAvailableSeatsFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

