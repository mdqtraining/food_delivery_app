import 'package:flutter/material.dart';
import 'package:hunger_hub/screens/login.dart';
import 'package:hunger_hub/screens/otp.dart';
import 'package:hunger_hub/screens/signup.dart';
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
        primaryColor: Color(0xFFFFA000),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(), // App starts here

      routes: {
        "/onboarding": (context) => const OnboardingScreen(),
        "/login": (context) => const LoginScreen(),
        "/signup": (context) => const SignupScreen(),
        "/otp": (context) => const OtpScreen(),
        "/home": (context) =>
            const Scaffold(body: Center(child: Text("Home Screen"))),
      },
    );
  }
}
