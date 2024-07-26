import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_icons.dart';
import 'package:cinemate/features/home/presentation/widgets/home_cine_mate_column.dart';
import 'package:flutter/material.dart';

class ProfileAndNotificationsRow extends StatelessWidget {
  const ProfileAndNotificationsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFF00B7FD),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Icon(
                AppIcons.faceIcon,
                color: AppColors.black,
                size: 30,
              ),
            ),
          ),
          const HomeCineMateColumn(),
          Stack(
            children:[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.darkPurple, // Border color
                    width: 2, // Border width
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.notifications_active_outlined,
                    color: AppColors.darkPurple, // Icon color
                  ),
                ),
              ),
              if(true)
                const Positioned(
                  right: 2,
                  top: 2,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: AppColors.white,
                  ),
                ),
            ]
          ),
        ],
      ),
    );
  }
}
