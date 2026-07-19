import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_images.dart';
import 'package:my_application/core/theme/theme_helper.dart';
import 'package:my_application/main.dart';

import '../providers/theme_provider.dart';
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

        const SizedBox(width: 12),

        IconButton(
          onPressed: () {
            context.read<ThemeProvider>().toggleTheme();
          },
          icon: Icon(
            context.watch<ThemeProvider>().themeMode == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode,
            color: AppColors.darkBlue,
          ),
        ),
      ],
    );
  }
}