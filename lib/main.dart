import 'package:flutter/material.dart';
import 'package:hunger_hub/screens/cart.dart';
import 'package:hunger_hub/screens/edit_pofile.dart';
import 'package:hunger_hub/screens/login.dart';
import 'package:hunger_hub/screens/main_screen.dart';
import 'package:hunger_hub/screens/otp.dart';
import 'package:hunger_hub/screens/signup.dart';
import 'package:hunger_hub/screens/forgot.dart';
import 'package:hunger_hub/screens/newpass.dart';
// import 'package:hunger_hub/screens/home.dart';
import 'package:hunger_hub/screens/profile.dart';
import 'package:hunger_hub/screens/search.dart';

import 'package:hunger_hub/splash.dart';
import 'screens/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hunger Hub',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFA000),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),

      routes: {
        "/onboarding": (context) => const OnboardingScreen(),
        "/login": (context) => const LoginScreen(),
        "/signup": (context) => const SignupScreen(),
        "/forgot": (context) => const ForgotPasswordScreen(),
        "/otp": (context) => const OtpScreen(),
        "/newpassword": (context) => const NewPasswordScreen(),
        "/home": (context) => const MainScreen(),
        "/main_screen": (context) => const MainScreen(),
        "/profile": (context) => const ProfileScreen(),
        "/editProfile": (context) => EditProfileScreen(),
        "/search": (context) => const SearchScreen(),
        "/cart": (context) => const CartScreen(),
      },
    );
  }
}
