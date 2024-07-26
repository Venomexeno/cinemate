import 'package:cinemate/core/services/service_locator.dart';
import 'package:cinemate/features/home/presentation/manager/get_coming_soon_movies_cubit/get_coming_soon_movies_cubit.dart';
import 'package:cinemate/features/home/presentation/manager/get_highlight_movies_cubit/get_highlight_movies_cubit.dart';
import 'package:cinemate/features/home/presentation/manager/get_movies_in_theaters_cubit/get_movies_in_theaters_cubit.dart';
import 'package:cinemate/features/home/presentation/pages/home_page.dart';
import 'package:cinemate/features/root/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:cinemate/features/root/presentation/widgets/bottom_nav_bar.dart';
import 'package:cinemate/features/tickets/presentation/pages/tickets_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, int>(
        builder: (context, index) {
          return Stack(children: [
            LazyIndexedStack(
              index: index,
              children: [
                MultiBlocProvider(
                  providers: [
                    BlocProvider<GetHighlightMoviesCubit>(
                      create: (context) =>
                      sl<GetHighlightMoviesCubit>()
                        ..getHighlightedMovies(),
                    ),
                    BlocProvider<GetMoviesInTheatersCubit>(
                      create: (context) => sl<GetMoviesInTheatersCubit>()..getMoviesInTheaters(),
                    ),
                    BlocProvider<GetComingSoonMoviesCubit>(
                      create: (context) => sl<GetComingSoonMoviesCubit>()..getComingSoonMovies(),
                    ),
                  ],
                  child: const HomePage(),
                ),
                const TicketsPage(),
              ],
            ),
            const BottomNavBar(),
          ]);
        },
      ),
    );
  }
}
