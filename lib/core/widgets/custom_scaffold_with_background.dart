import 'package:cinemate/core/constants/app_assets.dart';
import 'package:cinemate/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomScaffoldWithBackground extends StatelessWidget {
  const CustomScaffoldWithBackground({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.jetBlack,
          image: DecorationImage(
            image: AssetImage(AppAssets.background),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: body,
      ),
    );
  }
}
