import 'package:cinemate/core/widgets/custom_scaffold_with_background.dart';
import 'package:cinemate/features/movie_details/presentation/widgets/movie_details_page_body.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScaffoldWithBackground(
      body: MovieDetailsPageBody(),
    );
  }
}
