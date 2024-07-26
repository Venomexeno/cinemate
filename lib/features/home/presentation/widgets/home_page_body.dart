import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/features/home/presentation/widgets/home_coming_soon_movies_bloc_builder.dart';
import 'package:cinemate/features/home/presentation/widgets/home_highlight_indicator_bloc_builder.dart';
import 'package:cinemate/features/home/presentation/widgets/home_highlight_slider_bloc_builder.dart';
import 'package:cinemate/features/home/presentation/widgets/home_section_header.dart';
import 'package:cinemate/features/home/presentation/widgets/movies_in_theater_bloc_builder.dart';
import 'package:cinemate/features/home/presentation/widgets/profile_and_notifications_row.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  HomePageBodyState createState() => HomePageBodyState();
}

class HomePageBodyState extends State<HomePageBody> {
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 36),
          const ProfileAndNotificationsRow(),
          const SizedBox(height: 49),
          const HomeSectionHeader(
            sectionTitle: AppStrings.highlights,
          ),
          const SizedBox(height: 9),
          HomeHighlightSliderBlocBuilder(
            currentPageNotifier: _currentPageNotifier,
          ),
          const SizedBox(height: 13),
          HomeHighlightIndicatorBlocBuilder(
              currentPageNotifier: _currentPageNotifier),
          const SizedBox(height: 39),
          HomeSectionHeader(
            sectionTitle: AppStrings.newMoviesInTheaters,
            onTap: () {},
          ),
          const SizedBox(height: 9),
          const MoviesInTheaterBlocBuilder(),
          const SizedBox(height: 27),
          HomeSectionHeader(
            sectionTitle: AppStrings.comingSoon,
            onTap: () {},
          ),
          const SizedBox(height: 9),
          const HomeComingSoonMoviesBlocBuilder(),
          const SizedBox(height: 60) // Height of the bottom navigation bar
        ],
      ),
    );
  }
}
