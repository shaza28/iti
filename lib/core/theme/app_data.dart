import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_application/screens/home_screen.dart';

import '../../screens/login_screen.dart';
import '../../screens/sign_up_screen.dart';
import '../../screens/splash_screen.dart';

class AppImages {
  AppImages._();
  static const String base = "assets/images";
  static const String splashLogo = "$base/splashLogo.png";
  static const String loginLogo = "$base/loginLogo.png";
  static const String signUpBackground = "$base/signUpBackground.png";
  static const String googleIcon = "$base/google_icon.png";
  static const String  bannerImage = "$base/banner.png";
  static const String book1 = "$base/book1.png";
  static const String book2 = "$base/book2.png";
  static const String book3 = "$base/book3.png";
  static const String book4 = "$base/book4.png";
  static const String book5 = "$base/book5.png";

}

class AppColors {
  AppColors._();
  static const Color darkBlue = Color(0xFF215995);
  static const Color whiteBlue = Color(0xFFD3E3FF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFF585F6A);
  static const Color black= Color(0xFF000000);
}

class AppRoutes {
  static const String splashScreen = "/splash";
  static const String signUpScreen = "/signUp";
  static const String loginScreen = "/login";
  static const String homeScreen = "/home";


  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    signUpScreen: (context) => SignUpScreen(),
    loginScreen: (context) => LoginScreen(),
    homeScreen: (context) => HomeScreen(),

  };
}
