import 'package:cinemate/core/widgets/custom_scaffold_with_background.dart';
import 'package:cinemate/features/movie_details/presentation/widgets/movie_details_page_body.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithBackground(
      body: MovieDetailsPageBody(
        id: id,
      ),
    );
  }
}
