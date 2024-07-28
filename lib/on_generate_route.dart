import 'package:cinemate/core/constants/app_routes.dart';
import 'package:cinemate/core/services/service_locator.dart';
import 'package:cinemate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:cinemate/features/auth/presentation/pages/auth_page.dart';
import 'package:cinemate/features/auth/presentation/pages/sign_in_page.dart';
import 'package:cinemate/features/auth/presentation/pages/sign_up_page.dart';
import 'package:cinemate/features/movie_details/presentation/manager/get_movie_details_cubit/get_movie_details_cubit.dart';
import 'package:cinemate/features/movie_details/presentation/pages/movie_details_page.dart';
import 'package:cinemate/features/root/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:cinemate/features/root/presentation/pages/root_page.dart';
import 'package:cinemate/features/ticket_purchase/presentation/pages/ticket_purchase_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnGenerateRoute {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.authPageRoute:
        return MaterialPageRoute(
          builder: (_) => const AuthPage(),
          settings: settings,
        );

      case AppRoutes.signInPageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>(
            create: (context) => sl<AuthCubit>(),
            child: const SignInPage(),
          ),
          settings: settings,
        );

      case AppRoutes.signUpPageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>(
            create: (context) => sl<AuthCubit>(),
            child: const SignUpPage(),
          ),
          settings: settings,
        );

      case AppRoutes.rootPageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<BottomNavCubit>(
            create: (context) => sl<BottomNavCubit>(),
            child: const RootPage(),
          ),
          settings: settings,
        );

      case AppRoutes.movieDetailsPageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<GetMovieDetailsCubit>(
            create: (context) => sl<GetMovieDetailsCubit>()
              ..getMovieDetails(settings.arguments as String),
            child: const MovieDetailsPage(),
          ),
          settings: settings,
        );

      case AppRoutes.ticketPurchasePageRoute:
        return MaterialPageRoute(
          builder: (_) {
            return TicketPurchasePage(
              movieData: settings.arguments as Map<String, dynamic>
            );
          },
          settings: settings,
        );
    }
    return null;
  }
}
