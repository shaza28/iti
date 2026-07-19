import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_images.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Image.asset(
          AppImages.splashLogo,
          width: 34,
          height: 34,
        ),

        const SizedBox(width: 10),

        Text(
          "Lumina Books",
          style: TextStyle(
            color: AppColors.darkBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Spacer(),

        Icon(
          Icons.search_rounded,
          color: AppColors.darkBlue,
          size: 28,
        ),
      ],
    );
  }
}