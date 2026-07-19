import 'package:flutter/material.dart';

import '../../screens/home_screen.dart';
import '../../screens/login_screen.dart';
import '../../screens/sign_up_screen.dart';
import '../../screens/splash_screen.dart';

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
