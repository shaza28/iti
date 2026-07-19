import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class CustomActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color? color;

  const CustomActionButton({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xff2C2C2C) : AppColors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: color ?? Theme.of(context).iconTheme.color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }
}