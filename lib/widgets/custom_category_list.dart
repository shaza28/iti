import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_images.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;

  final List<String> categories = [
    "Fiction",
    "Science",
    "History",
    "Fantasy",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final selected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.darkBlue
                    : const Color(0xffEEF2F8),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color:
                    selected ? Colors.white : AppColors.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}