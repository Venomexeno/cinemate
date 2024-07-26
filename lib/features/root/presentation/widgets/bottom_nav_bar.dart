import 'dart:ui';
import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/features/root/presentation/widgets/animated_indicator_widget.dart';
import 'package:cinemate/features/root/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinemate/features/root/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, index) {
        return Align(
          alignment: FractionalOffset.bottomCenter,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 19.2,
                sigmaY: 19.2,
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  highlightColor: AppColors.transparent,
                  splashFactory: NoSplash.splashFactory,
                ),
                child: Stack(
                  children: [
                    BottomNavigationBarWidget(index: index),
                    AnimatedIndicatorWidget(index: index),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


