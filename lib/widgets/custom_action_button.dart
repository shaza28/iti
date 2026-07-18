import 'package:flutter/material.dart';
import '../core/theme/app_data.dart';

class CustomActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color color;

  const CustomActionButton({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.color = AppColors.gray,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}