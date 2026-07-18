import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../models/cart_model.dart';

class CustomCartCard extends StatefulWidget {
  final CartModel item;
  final VoidCallback? onDelete;

  const CustomCartCard({
    super.key,
    required this.item,
    this.onDelete,
  });

  @override
  State<CustomCartCard> createState() => _CustomCartCardState();
}

class _CustomCartCardState extends State<CustomCartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              widget.item.book.image,
              width: 80,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.book.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  widget.item.book.author,
                  style: const TextStyle(
                    color: AppColors.gray,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  widget.item.book.price,
                  style: const TextStyle(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (widget.item.quantity > 1) {
                          setState(() {
                            widget.item.quantity--;
                          });
                        }
                      },
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.whiteBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.remove, size: 18),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        widget.item.quantity.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.item.quantity++;
                        });
                      },
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: widget.onDelete,
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}