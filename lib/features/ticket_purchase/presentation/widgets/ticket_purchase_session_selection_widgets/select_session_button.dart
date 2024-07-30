import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/core/services/service_locator.dart';
import 'package:cinemate/features/ticket_purchase/presentation/manager/get_movie_sessions_cubit/get_movie_sessions_cubit.dart';
import 'package:cinemate/features/ticket_purchase/presentation/widgets/ticket_purchase_session_selection_widgets/movie_sessions_dialog_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectSessionButton extends StatefulWidget {
  const SelectSessionButton({
    super.key,
    required this.movieId,
  });

  final String movieId;

  @override
  State<SelectSessionButton> createState() => _SelectSessionButtonState();
}

class _SelectSessionButtonState extends State<SelectSessionButton> {
  late final ValueNotifier<String> _sessionNotifier;

  @override
  void initState() {
    super.initState();
    _sessionNotifier = ValueNotifier<String>(
        AppStrings.textWithStar(AppStrings.selectSession));
  }

  @override
  void dispose() {
    _sessionNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _sessionNotifier,
      builder: (context, value, child) {
        final bool sessionSelected =
            value != AppStrings.textWithStar(AppStrings.selectSession);
        return SizedBox(
          width: double.infinity,
          height: 67,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: sessionSelected
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
              showDialog(
                context: context,
                builder: (_) {
                  return BlocProvider<GetMovieSessionsCubit>(
                    create: (context) => sl<GetMovieSessionsCubit>()
                      ..getMovieSessions(widget.movieId),
                    child: MovieSessionsDialogBlocBuilder(
                      sessionNotifier: _sessionNotifier,
                      mainContext: context,
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
                    color: sessionSelected
                        ? AppColors.white
                        : AppColors.darkPurple,
                  ),
                ),
                if (!sessionSelected)
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.darkPurple,
                  ), //To Remove the Icon when the session is selected
              ],
            ),
          ),
        );
      },
    );
  }
}
