import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/core/widgets/custom_scaffold_with_background.dart';
import 'package:cinemate/features/tickets/presentation/manager/get_tickets_cubit/get_tickets_cubit.dart';
import 'package:cinemate/features/tickets/presentation/widgets/tickets_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithBackground(
      body: BlocBuilder<GetTicketsCubit, GetTicketsState>(
        builder: (context, state) {
          if (state is GetTicketsSuccess) {
            final tickets = state.tickets;
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 21.0, vertical: 36.0),
                  sliver: SliverToBoxAdapter(
                      child: Text(
                    textAlign: TextAlign.center,
                    'My Tickets',
                    style: AppStyles.bold20,
                  )),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: tickets.length,
                      (context, index) {
                        return Padding(
                          padding:  EdgeInsets.only(bottom: index == tickets.length - 1 ? 0.0 : 20.0),
                          child: TicketsListViewItem(ticket: tickets[index]),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          } else if (state is GetTicketsFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

