import 'package:flutter/material.dart';
import '../core/cart_data.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_images.dart';
import '../models/book_model.dart';
import 'custom_button.dart';

class CustomBestSellerCard extends StatelessWidget {
  final BookModel book;

  const CustomBestSellerCard({
    super.key,
    required this.book,
  });

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
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              book.image,
              width: 75,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  book.author,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(book.rate),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  book.price,
                  style: TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            width: 110,
            child: CustomButton(
              text: "Add To Cart",
              height: 42,
              borderRadius: 12,
              fontSize: 13,
              onPressed: () {
                addToCart(book);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${book.title} added to cart"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}