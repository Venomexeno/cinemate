import 'package:cinemate/core/widgets/custom_scaffold_with_background.dart';
import 'package:cinemate/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffoldWithBackground(
      body: HomePageBody(),
    );
  }
}
