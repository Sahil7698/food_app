import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/views/burger_page.dart';
import 'package:food_app/views/cart_page.dart';
import 'package:food_app/views/details_page.dart';
import 'package:food_app/views/drinks_page.dart';
import 'package:food_app/views/favorite_page.dart';
import 'package:food_app/views/home_page.dart';
import 'package:food_app/views/recipe_page.dart';
import 'package:food_app/views/snack_page.dart';
import 'package:food_app/views/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/splash_screen', page: () => const SplashScreen()),
        GetPage(name: '/home_page', page: () => const HomePage()),
        GetPage(name: '/burger_page', page: () => const BurgerPage()),
        GetPage(name: '/drink_page', page: () => const DrinkPage()),
        GetPage(name: '/recipe_page', page: () => const RecipePage()),
        GetPage(name: '/snack_page', page: () => const SnackPage()),
        GetPage(name: '/cart_page', page: () => const CartPage()),
        GetPage(name: '/favorite_page', page: () => const Favourite_Page()),
        GetPage(name: '/detail_page', page: () => const DetailPage(data: {})),
      ],
      home: const SplashScreen(),
    ),
  );
}
