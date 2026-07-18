import 'package:flutter/material.dart';
import '../core/theme/app_data.dart';
import '../core/book_data.dart';
import '../screens/product_details_screen.dart';
import '../widgets/custom_book_card.dart';
import '../widgets/custom_banner.dart';
import '../widgets/custom_best_seller_card.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/custom_category_list.dart';
import '../widgets/custom_home_app_bar.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/custom_section_title.dart';
import 'cart_screen.dart';
import 'favourite_screen..dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              break;

            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const FavouriteScreen(),
                ),
              );
              break;

            case 2:
              print("Cart pressed");

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              );

              break;


            case 3:
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Profile screen coming soon"),
                  duration: Duration(seconds: 1),
                ),
              );

              break;
          }
        },
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const CustomHomeAppBar(),

              const SizedBox(height: 24),

              const Text(
                "Hello, Reader!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                "Discover your next favorite story.",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.gray,
                ),
              ),

              const SizedBox(height: 20),

              const CustomSearchBar(),

              const SizedBox(height: 20),

              const CustomBanner(),

              const SizedBox(height: 28),

              const SectionTitle(title: "Categories"),

              const SizedBox(height: 16),

              const CategoryList(),

              const SizedBox(height: 28),

              const SectionTitle(title: "Featured Books"),

              const SizedBox(height: 16),

              SizedBox(
                height: 320,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: 16),

                  itemBuilder: (context, index) {

                    return CustomBookCard(
                      book: books[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailsScreen(
                              book: books[index],
                            ),
                          ),
                        );
                      },
                    );

                  },
                ),
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Best Sellers",
              ),

              const SizedBox(height: 16),

              const CustomBestSellerCard(
                image: AppImages.book1,
                title: "Organic Rhythm",
                author: "Julian Greene",
                price: "\$21.50",
                rate: "4.8",
              ),

              const SizedBox(height: 15),

              const CustomBestSellerCard(
                image: AppImages.book2,
                title: "The Glass City",
                author: "Ariel S. Thorne",
                price: "\$18.99",
                rate: "4.7",
              ),

              const SizedBox(height: 15),

              const CustomBestSellerCard(
                image: AppImages.book3,
                title: "Echoes",
                author: "James Carter",
                price: "\$27.00",
                rate: "4.9",
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}