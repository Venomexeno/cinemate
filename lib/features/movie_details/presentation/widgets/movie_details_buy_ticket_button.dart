import 'dart:ui';

import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/features/auth/presentation/widgets/auth_elevated_button.dart';
import 'package:flutter/material.dart';

class MovieDetailsBuyTicketButton extends StatelessWidget {
  const MovieDetailsBuyTicketButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 19.2,
            sigmaY: 19.2,
          ),
          child: Container(
            height: 104,
            color: AppColors.black.withOpacity(0.21),
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 26),
            child: AuthElevatedButton(
              onPressed: () {},
              text: 'data',
            ),
          ),
        ),
      ),
    );
  }
}
