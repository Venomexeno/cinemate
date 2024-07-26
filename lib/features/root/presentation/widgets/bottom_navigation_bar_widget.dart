import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinemate/features/root/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int index;

  const BottomNavigationBarWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      enableFeedback: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.black.withOpacity(0.21),
      items:[
        BottomNavigationBarItem(
          label: '',
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              AppIcons.homeIcon,
              key: ValueKey<int>(index),
              size: index == 0 ? 27 : 20,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              AppIcons.ticketIcon,
              key: ValueKey<int>(index),
              size: index == 1 ? 27 : 20,
            ),
          ),
        ),
      ],
      currentIndex: index,
      selectedItemColor: Colors.deepPurpleAccent,
      unselectedItemColor: Colors.white,
      onTap: (newIndex) {
        context.read<BottomNavCubit>().changePage(newIndex);
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
