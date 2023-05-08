import 'package:flutter/material.dart';
import 'package:food_app/views/home_page.dart';
import 'package:food_app/views/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/splash_screen', page: () => const SplashScreen()),
        GetPage(name: '/home_page', page: () => const HomePage()),
        GetPage(name: '/burger_page', page: () => const HomePage()),
        // GetPage(name: '/favourite_page', page: () => const Favourite_Page()),
        // GetPage(name: '/login_page', page: () => const Login_Page()),
      ],
      home: const SplashScreen(),
    ),
  );
}
