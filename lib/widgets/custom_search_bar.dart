import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/theme/app_colors.dart';
import '../providers/theme_provider.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<ThemeProvider>().themeMode == ThemeMode.dark;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2A2A2A) : AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: isDark ? Colors.white70 : AppColors.gray,
          ),
          hintText: "Search by title, author, or genre...",
          hintStyle: TextStyle(
            color: isDark ? Colors.white54 : AppColors.gray,
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
        ),
      ),
    );
  }
}