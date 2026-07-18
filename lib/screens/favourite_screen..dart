import 'package:flutter/material.dart';

import '../core/favourite_data.dart';
import '../core/theme/app_data.dart';
import '../core/book_data.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/custom_favourite_card.dart';
import 'home_screen.dart';
import 'product_details_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  int currentIndex = 1;

  int selectedCategory = 0;

  final List<String> categories = [
    "All Books",
    "Fiction",
    "Non-Fiction",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          "My Favourites",
          style: TextStyle(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: AppColors.darkBlue,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),

        child: Column(
          children: [

            const SizedBox(height: 10),

            SizedBox(
              height: 38,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) =>
                const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final selected =
                      selectedCategory == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.darkBlue
                            : AppColors.whiteBlue,
                        borderRadius:
                        BorderRadius.circular(18),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: selected
                              ? Colors.white
                              : AppColors.darkBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: favouriteBooks.isEmpty
                  ? const Center(
                child: Text(
                  "No Favourite Books Yet",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.gray,
                  ),
                ),
              )
                  : GridView.builder(
                itemCount: favouriteBooks.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 18,
                  childAspectRatio: .58,
                ),
                itemBuilder: (context, index) {
                  return CustomFavouriteCard(
                    book: favouriteBooks[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailsScreen(
                            book: favouriteBooks[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomeScreen(),
                ),
              );
              break;

            case 1:
              break;

            case 2:
            // Cart Screen
              break;

            case 3:
            // Profile Screen
              break;
          }
        },
      ),
    );
  }
}