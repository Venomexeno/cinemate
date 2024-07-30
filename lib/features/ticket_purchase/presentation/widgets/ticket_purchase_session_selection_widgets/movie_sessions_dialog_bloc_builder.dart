import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/core/utils/format_timestamp.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/get_movie_sessions_cubit/get_movie_sessions_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/ticket_data_cubit/ticket_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieSessionsDialogBlocBuilder extends StatelessWidget {
  const MovieSessionsDialogBlocBuilder({
    super.key,
    required this.mainContext, required this.sessionNotifier,
  });

  final BuildContext mainContext;
  final ValueNotifier<String> sessionNotifier;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.jetBlack,
      title: Text(AppStrings.selectSession,
          style: AppStyles.semiBold20.copyWith(color: AppColors.darkPurple)),
      content: BlocBuilder<GetMovieSessionsCubit, GetMovieSessionsState>(
        builder: (context, state) {
          if (state is GetMovieSessionsSuccess) {
            final movieSessions = state.movieSessions;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  movieSessions.length,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index == movieSessions.length - 1 ? 0 : 20,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 57),
                          backgroundColor:
                              AppColors.darkPurple.withOpacity(0.4),
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        onPressed: () {
                          sessionNotifier.value =
                              formatTimestamp(movieSessions[index].date);
                          mainContext.read<TicketDataCubit>().selectSession(
                            session: formatTimestamp(movieSessions[index].date),
                          );
                          Navigator.pop(context);
                        },
                        child: Text(
                          formatTimestamp(movieSessions[index].date),
                          style: AppStyles.semiBold15,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (state is GetMovieSessionsFailure) {
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
