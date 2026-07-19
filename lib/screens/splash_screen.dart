import 'package:flutter/material.dart';
import 'package:my_application/core/theme/app_images.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBlue,
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            SizedBox(height: 20),
            Image.asset(AppImages.splashLogo),
            Text(
              "Lumina Books",
              style: TextStyle(
                color: AppColors.darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Discover Your Next Favorite Book",
              style: TextStyle(color: AppColors.gray),
            ),

          ],
        ),
      ),
    );
  }
}
