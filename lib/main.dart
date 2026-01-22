import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hunger_hub/uttils/dark_theme.dart';
import 'package:hunger_hub/uttils/ligth_theme.dart';
import 'package:hunger_hub/uttils/shared_preffrence.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Auth/auth_gate.dart';

import 'screens/main_screen.dart';
import 'screens/onboarding.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/forgot.dart';
import 'screens/otp.dart';
import 'screens/newpass.dart';
import 'screens/edit_pofile.dart';
import 'screens/category_results.dart';

// import 'MainScreen/main_screen.dart';
import 'MainScreen/profile.dart';
import 'MainScreen/search.dart';
import 'MainScreen/cart.dart';

import 'screens/my_address.dart';
import 'screens/my_favorite.dart';
import 'screens/my_orders.dart';
import 'screens/payment_methods.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // THIS removes the black bar
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hunger Hub',
      theme: SharedPreffrencerhelper.getTheme() == true ? darkthem : lightthem,

      // AUTH FLOW ENTRY POINT
      home: const AuthGate(),

      routes: {
        "/onboarding": (context) => const OnboardingScreen(),
        "/login": (context) => const LoginScreen(),
        "/signup": (context) => const SignupScreen(),
        "/forgot": (context) => const ForgotPasswordScreen(),
        "/otp": (context) => const OtpScreen(),
        "/newpassword": (context) => const NewPasswordScreen(),

        "/home": (context) => const MainScreen(),
        "/profile": (context) => const ProfileScreen(),
        "/editProfile": (context) => const EditProfileScreen(),
        "/search": (context) => const SearchScreen(),
        "/cart": (context) => const CartScreen(),

        "/category": (context) => const CategoryResultScreen(categoryId: ''),

        "/MyOrdersScreen": (context) => const MyOrdersScreen(),
        "/PaymentMethodsScreen": (context) => const PaymentMethodsScreen(),
        "/Address": (context) => const MyAddressScreen(),
        "/Favorites": (context) => const MyFavoritesScreen(),
      },
    );
  }
}
