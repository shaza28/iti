import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_images.dart';
import '../core/cart_data.dart';
import '../models/book_model.dart';
import '../models/cart_model.dart';
import '../widgets/custom_action_button.dart';
import 'cart_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final BookModel book;

  const ProductDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon:  Icon(Icons.arrow_back_ios, color: Theme.of(context).iconTheme.color,),
        ),
        title: Text(
          "Lumina Books",
          style: TextStyle(
            color:  Theme.of(context).textTheme.titleLarge?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: Icon(Icons.search, color:  Theme.of(context).iconTheme.color,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 180,
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.black,
                      blurRadius: 18,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    book.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.book,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomActionButton(
                  icon: Icons.favorite_border,
                  title: "Wishlist",
                  color: AppColors.darkBlue,
                  onTap: () {},
                ),
               CustomActionButton(
                  icon: Icons.share_outlined,
                  title: "Share",
                ),
               CustomActionButton(
                  icon: Icons.remove_red_eye_outlined,
                  title: "Preview",
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text(
              book.title,
              style:TextStyle(fontSize: 22, fontWeight: FontWeight.bold,    color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              book.author,
              style: TextStyle( fontSize: 15,  color: isDark ? Colors.lightBlueAccent : AppColors.darkBlue,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text(book.rate),
                 Text(" (2.4k)", style: TextStyle(    color: isDark ? Colors.lightBlueAccent : AppColors.darkBlue,
                 )),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _tag(context, "Literary Fiction"),
                _tag(context, "Mystery"),
                _tag(context, "Best Seller"),
              ],
            ),
            const SizedBox(height: 28),
             Text(
              "About the Book",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,    color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 12),
             Text(
              "Step into a world where silence speaks louder than words. "
              "The Midnight Archive follows a mysterious librarian tasked "
              "with guarding forgotten stories and hidden secrets. "
              "Every chapter reveals another mystery that keeps readers engaged.",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).textTheme.bodyMedium?.color,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 6),
            TextButton(onPressed: () {}, child: const Text("Read More")),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text(
                  "Reader Reviews",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                Text("View All", style: TextStyle(    color: isDark ? Colors.lightBlueAccent : AppColors.darkBlue,
                )),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "Julianne D.",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                    ),
                  ),
                  const SizedBox(height: 8),
                   Text(
                    "\"A hauntingly beautiful journey. I couldn't put it down.\"",
                    style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(   color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                      ),
                      Text(
                        book.price,
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        addToCart(book);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Book added to cart"),
                            duration: Duration(seconds: 1),
                          ),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CartScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: Icon(Icons.shopping_cart, color: AppColors.white),
                      label: Text(
                        "Add to Cart",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _tag(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
    );
  }}
