import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xffF7F8FC),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xff7B8794),
          ),
          hintText: "Search by title, author, or genre...",
          hintStyle: TextStyle(
            color: Color(0xff9CA3AF),
            fontSize: 14,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 18,
          ),
        ),
      ),
    );
  }
}