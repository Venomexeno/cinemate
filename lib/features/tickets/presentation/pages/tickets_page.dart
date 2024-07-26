import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/widgets/custom_scaffold_with_background.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffoldWithBackground(
        body: Align(
      alignment: Alignment.center,
      child: Text(
        'Tickets Page',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 24,
        ),
      ),
    ));
  }
}
